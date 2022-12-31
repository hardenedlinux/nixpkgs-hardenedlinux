{
  inputs,
  cell,
}: let
  inherit (inputs) std self;
  l = inputs.nixpkgs.lib // builtins;

  __inputs__ = inputs.cells-lab.common.lib.callFlake ./lib/lock {
    nixpkgs.locked = inputs.nixpkgs.sourceInfo;

    crane.inputs.nixpkgs = "nixpkgs";
    dream2nix.inputs.nixpkgs = "nixpkgs";
  };
  nixpkgs = inputs.nixpkgs.appendOverlays [
    __inputs__.gomod2nix.overlays.default
    __inputs__.rust-overlay.overlays.default
    (final: prev: {
      machlib = import __inputs__.mach-nix {
        pkgs = prev;
        pypiData = __inputs__.pypi-deps-db;
      };
      dream2nix = __inputs__.dream2nix.lib;
      crane = __inputs__.crane.mkLib final;
    })
  ];
in rec {
  inherit __inputs__ nixpkgs;

  filterDerivations = filterAttrsOnlyRecursive (n: attrs: l.isDerivation attrs || attrs.recurseForDerivations or false);

  filterAttrsOnlyRecursive = pred: set:
    l.listToAttrs (
      l.concatMap
      (
        name: let
          v = set.${name};
        in
          if pred name v
          then [
            (l.nameValuePair name (
              if builtins.isAttrs v && !l.isDerivation v
              then filterAttrsOnlyRecursive pred v
              else v
            ))
          ]
          else []
      )
      (builtins.attrNames set)
    );
}
