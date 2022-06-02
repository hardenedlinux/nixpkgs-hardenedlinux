{
  self,
  inputs,
  channels,
  ...
}:
with channels;
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
        name = "mkdoc";
        command = ''
          rsync -avzh ${nixpkgs.org-roam-publish}/* docs/publish
          cd docs/publish && cp ../config.toml .
          hugo "$@"
          cp -rf --no-preserve=mode,ownership public/posts/index.html ./public/
        '';
      }
      {
        name = "nvfetcher-update";
        command = "nix develop github:GTrunSec/cells-lab#devShells.x86_64-linux.update --no-write-lock-file --command nvfetcher-update ./nix/sources.toml";
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
