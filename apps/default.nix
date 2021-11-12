inputs: channels:
with inputs.utils.lib;
with channels.nixpkgs;
{
  gh-nix-update = with channels.nixpkgs;mkApp
    {
      drv = writeShellScriptBin "gh-nix-update" ''
        sed -i 's|https://github.com/numtide/nix-.*./releases/download/nix-.*.|${toString nixpkgs-hardenedlinux-sources.nix-unstable-installer.src.urls}|' .github/workflows/checks.yaml
      '';
    };
  nix-lint = with channels.nixpkgs;mkApp {
    drv = writeShellScriptBin "nix-lint" ''
      export PATH=${pkgs.lib.strings.makeBinPath [ inputs.statix.defaultPackage."x86_64-linux"
        findutils]}
      source ${./nix-lint.bash}
    '';
  };
}
