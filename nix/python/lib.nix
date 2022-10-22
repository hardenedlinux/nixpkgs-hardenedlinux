{
  inputs,
  cell,
}: {
  nixpkgs = inputs.cells._common.lib.nixpkgs.appendOverlays [
    cell.overlays.default
    (final: prev: {})
  ];
}
