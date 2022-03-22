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
      (channels.nixpkgs.devshell.importTOML ./devshell.toml)
    ];
    packages = [
      nixpkgs.treefmt
      nixpkgs.shfmt
      nixpkgs.nodePackages.prettier
      nixpkgs.nodePackages.prettier-plugin-toml
      nixpkgs.python3Packages.black
    ];
    commands = [];
    devshell.startup.nodejs-setuphook = channels.nixpkgs.lib.stringsWithDeps.noDepEntry ''
      export NODE_PATH=${channels.nixpkgs.nodePackages.prettier-plugin-toml}/lib/node_modules:$NODE_PATH
    '';
  }
