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
        inputs.cells-lab.automation.devshellProfiles.default

        inputs.cells.python.devshellProfiles.default
        inputs.cells.go.devshellProfiles.default
        inputs.cells.pkgs.devshellProfiles.default
      ];

      nixago = [
        cell.nixago.treefmt
      ];
    };
    mkdoc = {
      name = "nixpkgs-hardenedlinux-doc";
      commands = [
        {
          name = "mkdoc";
          command = "nix run $PRJ_ROOT#x86_64-linux.automation.entrypoints.mkdoc -- $@";
          help = "mkdoc with org-roam-book";
          category = "docs";
        }
      ];
    };
  }
