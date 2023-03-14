{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  nixpkgs = inputs.cells.common.lib.nixpkgs.appendOverlays [
    cell.overlays.default
    (final: prev: {})
  ];
in
  inputs.cells.common.lib.filterDerivations (cell.overlays.default nixpkgs nixpkgs)
