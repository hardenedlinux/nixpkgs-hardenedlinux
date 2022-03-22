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
    ];
    commands = [];
    devshell.startup.nodejs-setuphook = nixpkgs.lib.stringsWithDeps.noDepEntry ''
      export NODE_PATH=${nixpkgs.nodePackages.prettier-plugin-toml}/lib/node_modules:$NODE_PATH
    '';
  }
