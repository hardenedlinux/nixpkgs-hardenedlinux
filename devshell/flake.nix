{
  description = "Vast Cells development shell";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  inputs.devshell.url = "github:numtide/devshell?ref=refs/pull/169/head";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.cells.url = "github:GTrunSec/DevSecOps-cells";
  inputs.cells.inputs.std.url = "github:divnix/std";
  outputs = inputs:
    inputs.flake-utils.lib.eachSystem [ "x86_64-linux" ] (
      system: let
        cellsProfiles = inputs.cells.devshellProfiles.${system};
        devshell = inputs.devshell.legacyPackages.${system};
        nixpkgs = inputs.nixpkgs.legacyPackages.${system};
      in
        {
          devShell = devshell.mkShell {
            name = "Hardenedlinux";
            imports = [
              cellsProfiles.common
              (devshell.importTOML ./devshell.toml)
            ];
            commands = [ ];
            packages = [
              nixpkgs.shfmt
              nixpkgs.nodePackages.prettier
              nixpkgs.nodePackages.prettier-plugin-toml
              nixpkgs.python3Packages.black
            ];
            devshell.startup.nodejs-setuphook = nixpkgs.lib.stringsWithDeps.noDepEntry ''
              export NODE_PATH=${nixpkgs.nodePackages.prettier-plugin-toml}/lib/node_modules:$NODE_PATH
            '';
          };
        }
    );
}
