{
  inputs,
  cell,
}: let
  l = nixpkgs.lib // builtins;
  inherit (inputs) nixpkgs std;
in
  l.mapAttrs (_: std.lib.dev.mkShell) {
    default = {...}: {
      std.adr.enable = false;

      name = "nixpkgs-hardenedlinux";

      imports = [
        inputs.cells-lab.main.devshellProfiles.default
        inputs.cells.python.devshellProfiles.default
        inputs.cells.go.devshellProfiles.default
      ];

      nixago = [
        cell.nixago.mdbook
        cell.nixago.treefmt
      ];
    };
  }
