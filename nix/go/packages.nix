{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  nixpkgs = inputs.cells._common.lib.nixpkgs.appendOverlays [
    cell.overlays.default
    (final: prev: {
    })
  ];
in
  l.removeAttrs (cell.overlays.default nixpkgs nixpkgs) ["nixpkgs-hardenedlinux-go-sources" "update"]
