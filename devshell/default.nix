{
  self,
  inputs,
  channels,
  ...
}:
channels.nixpkgs.devshell.mkShell {
  name = "nixpkgs-hardenendlinux";
  imports = [
    (channels.nixpkgs.devshell.importTOML ./devshell.toml)
  ];
  commands = [];
}
