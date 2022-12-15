{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  nixpkgs = cell.lib.nixpkgs;
in
  inputs.cells.common.lib.filterDerivations (cell.overlays.default nixpkgs.python3Packages nixpkgs)
