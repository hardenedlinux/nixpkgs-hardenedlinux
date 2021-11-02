inputs: channels:
with inputs.utils.lib;
{
  gh-nix-update = with channels.nixpkgs;mkApp
    {
      drv = writeShellScriptBin "gh-nix-update" ''
        sed -i 's|https://github.com/numtide/nix-unstable-installer/releases/download/nix-.*.*|https://github.com/numtide/nix-unstable-installer/releases/download/${nixpkgs-hardenedlinux-sources.nix-unstable-installer.version}/install|' .github/workflows/checks.yaml
      '';
    };
}
