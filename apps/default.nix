inputs: channels:
with inputs.utils.lib;
{
  gh-nix-update = with channels.nixpkgs;mkApp
    {
      drv = writeShellScriptBin "gh-nix-update" ''
        sed -i 's|https://github.com/numtide/nix-.*./releases/download/nix-.*.|${toString nixpkgs-hardenedlinux-sources.nix-unstable-installer.src.urls}|' .github/workflows/checks.yaml
      '';
    };
}
