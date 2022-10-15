{
  inputs,
  cell,
}: let
  inherit (inputs) std self;
  __modules__ = inputs.cells-lab.main.lib.callFlake "${(std.incl self ["lock"])}/lock/modules" {
    nixpkgs.locked = inputs.nixpkgs-lock.sourceInfo;

    crane.inputs.nixpkgs = "nixpkgs";
    dream2nix.inputs.nixpkgs = "nixpkgs";
  };
  nixpkgs = inputs.nixpkgs.appendOverlays [
    __modules__.gomod2nix.overlays.default
    (final: prev: {
      machlib = import __modules__.mach-nix {
        pkgs = prev;
        pypiData = __modules__.pypi-deps-db;
      };
      dream2nix = __modules__.dream2nix.lib;
      crane = __modules__.crane.mkLib final;
    })
  ];
in {
  inherit __modules__ nixpkgs;
}
