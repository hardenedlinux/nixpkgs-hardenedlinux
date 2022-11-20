{
  inputs,
  cell,
}: let
  inherit (inputs) std self;
  __inputs__ = inputs.cells-lab.common.lib.callFlake "${(std.incl self ["lock"])}/lock" {
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
in {
  inherit __inputs__ nixpkgs;
}
