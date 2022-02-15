{ inputs, channels, self }:let
  cellsProfiles = inputs.cells.devshellProfiles.${channels.nixpkgs.stdenv.hostPlatform.system};
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
