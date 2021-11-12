inputs: channels:
with inputs.utils.lib;
with channels.nixpkgs;
{
  # nix-lint = with channels.nixpkgs;mkApp {
  #   drv = writeShellScriptBin "nix-lint" ''
  #     export PATH=${pkgs.lib.strings.makeBinPath [ inputs.statix.defaultPackage."x86_64-linux"
  #       findutils]}
  #     source ${./nix-lint.bash}
  #   '';
  # };
}
