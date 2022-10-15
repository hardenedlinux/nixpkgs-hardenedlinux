{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  nixpkgs = inputs.cells._main.lib.nixpkgs.appendOverlays [
    cell.overlays.default
    cell.overlays.tests
    (final: prev: {
    })
  ];
in
  l.removeAttrs (cell.overlays.default nixpkgs nixpkgs) ["nixpkgs-hardenedlinux-pkgs-sources"]
