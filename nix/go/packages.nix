{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  nixpkgs = inputs.cells._main.lib.nixpkgs.appendOverlays [
    cell.overlays.default
    (final: prev: {
      nixpkgs-hardenedlinux-sources = prev.callPackage ./packages/_sources/generated.nix {};
      update-package = prev.callPackage ./packages/update-package {};
    })
  ];
in
  cell.overlays.default nixpkgs nixpkgs
