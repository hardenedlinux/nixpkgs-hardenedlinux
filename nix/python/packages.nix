{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  nixpkgs = cell.lib.nixpkgs;
in
  l.removeAttrs (cell.overlays.packages nixpkgs.python3Packages nixpkgs) ["nixpkgs-hardenedlinux-python-sources"]
