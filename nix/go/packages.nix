{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  nixpkgs = inputs.cells._main.lib.nixpkgs.appendOverlays [
    cell.overlays.default
    (final: prev: {
    })
  ];
in
  cell.overlays.default nixpkgs nixpkgs
