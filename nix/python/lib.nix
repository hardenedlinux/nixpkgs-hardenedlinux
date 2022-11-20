{
  inputs,
  cell,
}: {
  nixpkgs = inputs.cells.common.lib.nixpkgs.appendOverlays [
    cell.overlays.default
    (final: prev: {})
  ];
}
