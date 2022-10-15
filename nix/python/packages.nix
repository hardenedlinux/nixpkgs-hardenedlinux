{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  nixpkgs = inputs.cells._main.lib.nixpkgs.appendOverlays [
    cell.overlays.default
    (final: prev: {
      nixpkgs-hardenedlinux-python-sources = prev.callPackage ./packages/_sources/generated.nix {};
    })
  ];
in
  cell.overlays.default nixpkgs nixpkgs
