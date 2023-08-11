{ inputs, cell }:
let
  inherit (inputs) std-ext;
  inherit (inputs.std-ext.inputs) flops;
  l = inputs.nixpkgs.lib // builtins;

  callInputs =
    (flops.lib.flake.pops.default.setInitInputs ./lib/lock).setSystem
      inputs.nixpkgs.system;

  __inputs__ = callInputs.outputsForInputs;

  nixpkgs = inputs.nixpkgs.appendOverlays [
    __inputs__.gomod2nix.overlays.default
    __inputs__.rust-overlay.overlays.default
    (final: prev: {
      dream2nix = __inputs__.dream2nix.lib;
      crane = __inputs__.crane.mkLib final;
    })
  ];
in
{
  inherit __inputs__ nixpkgs callInputs;

  filterDerivations = std-ext.lib.attrsets.filterDerivations;
}
