inputs: channels:
with inputs.utils.lib;
{
  gh-nix-update = with channels.nixpkgs;mkApp
    {
      drv = writeShellScriptBin "gh-nix-update" ''
        sed -i 's|https://github.com/numtide/nix-.*./releases/download/nix-.*.|${toString nixpkgs-hardenedlinux-sources.nix-unstable-installer.src.urls}|' .github/workflows/checks.yaml
      '';
    };
  nix-lint = with channels.nixpkgs;mkApp
    {
      drv = writeShellScriptBin "nix-lint" ''
        set -euo pipefail
        export PATH=${inputs.statix.defaultPackage."x86_64-linux"}/bin:${findutils}/bin:$PATH
        for path in $(find "$PRJ_ROOT" -name '*.nix'  -not -name 'generated.nix')
        do
           statix "$@" "$path"
        done
      '';
    };
}
