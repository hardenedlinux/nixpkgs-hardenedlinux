{ inputs, channels, self }:let
  cellsProfiles = inputs.cells.devshellProfiles."x86_64-linux";
in
channels.nixpkgs.devshell.mkShell {
  name = "Hardenedlinux";
  imports = [ cellsProfiles.common
              (channels.nixpkgs.devshell.importTOML ./devshell.toml)
            ];
  commands = [ ];
  packages = with channels.nixpkgs;[
    shfmt
  ];
}
