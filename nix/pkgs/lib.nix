{ inputs, cell }:
let
  inherit (inputs.cells.common.lib) __inputs__;
in
{
  nixpkgs = inputs.cells.common.lib.nixpkgs.appendOverlays [
    cell.overlays.default
    cell.overlays.python
    __inputs__.nix-npm-buildpackage.overlays.default
    __inputs__.pnpm2nix.overlays.default
  ];
}
