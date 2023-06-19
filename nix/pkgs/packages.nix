{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  nixpkgs = cell.lib.nixpkgs;
in
  inputs.cells.common.lib.filterDerivations (cell.overlays.loader nixpkgs nixpkgs).toplevel //
  inputs.cells.common.lib.filterDerivations ((cell.overlays.loader nixpkgs nixpkgs).python nixpkgs.python3Packages nixpkgs.python3Packages)
