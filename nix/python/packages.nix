{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  nixpkgs = cell.lib.nixpkgs;
in
  l.removeAttrs (cell.overlays.default nixpkgs nixpkgs) ["nixpkgs-hardenedlinux-python-sources"]
