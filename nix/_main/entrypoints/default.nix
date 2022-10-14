{
  inputs,
  cell,
}: let
  inherit (inputs.cells-lab._writers.lib) writeShellApplication;
  inherit (inputs) self nixpkgs std;
in {
}
