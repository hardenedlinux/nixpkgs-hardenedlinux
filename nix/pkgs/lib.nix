{
  inputs,
  cell,
}: let
  inherit (inputs.cells._common.lib) __inputs__;
  in {
  nixpkgs = inputs.cells._common.lib.nixpkgs.appendOverlays [
    cell.overlays.default
    cell.overlays.tests
    __inputs__.nix-npm-buildpackage.overlays.default
    (final: prev: {})
  ];
}
