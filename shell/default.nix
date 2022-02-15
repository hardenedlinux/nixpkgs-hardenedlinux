{ inputs, channels, self }:let
  cellsProfiles = inputs.cells.devshellProfiles.${channels.nixpkgs.stdenv.hostPlatform.system};
in
channels.nixpkgs.devshell.mkShell {
  name = "Hardenedlinux";
  imports = [ cellsProfiles.cliche ];
  commands = [ ];
  packages = with channels.nixpkgs;[
    shfmt
  ];
}
