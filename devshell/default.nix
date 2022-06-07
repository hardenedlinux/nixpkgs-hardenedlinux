{
  self,
  inputs,
  channels,
  ...
}:
with channels; let
in
  nixpkgs.devshell.mkShell {
    name = "nixpkgs-hardenendlinux";
    imports = [
      (nixpkgs.devshell.importTOML ./devshell.toml)
      (nixpkgs.devshell.importTOML ./tests.toml)
    ];
    packages = [
      nixpkgs.treefmt
      nixpkgs.shfmt
      nixpkgs.nodePackages.prettier
      nixpkgs.nodePackages.prettier-plugin-toml
      nixpkgs.python3Packages.black
      nixpkgs.hugo
    ];
    commands = [
      {
        package = nixpkgs.mkdoc;
      }
      {
        name = "nvfetcher-update";
        command = "nix develop github:GTrunSec/cells-lab#devShells.x86_64-linux.update --no-write-lock-file --command nvfetcher-update ./packages/sources.toml";
        help = "run nvfetcher-update with your sources.toml";
      }
      {
        name = "nix-github-update";
        command = "nix develop github:GTrunSec/cells-lab#devShells.x86_64-linux.update --no-write-lock-file --command nix-github-update";
        help = "run nix-github-update";
      }
    ];
    devshell.startup.nodejs-setuphook = nixpkgs.lib.stringsWithDeps.noDepEntry ''
      export NODE_PATH=${nixpkgs.nodePackages.prettier-plugin-toml}/lib/node_modules:$NODE_PATH
    '';
  }
