inputs: channels:
with inputs.utils.lib;
with channels.nixpkgs;
let
  writeBashWithPaths = import ../lib/writeBashWithPaths.nix { pkgs = channels.nixpkgs; };
in
(
  (lib.utils-extend.pathsToNixScript ./.) channels.nixpkgs (lib.utils-extend.filterBash ./.) "bash"
) // {
  gh-nix-update = with channels.nixpkgs;mkApp
    {
      drv = writeShellScriptBin "gh-nix-update" ''
        sed -i 's|https://github.com/numtide/nix-.*./releases/download/nix-.*.|${toString nixpkgs-hardenedlinux-sources.nix-unstable-installer.src.urls}|' .github/workflows/checks.yaml
      '';
    };
  nix-lint = with channels.nixpkgs;mkApp {
    drv = writeBashWithPaths [
      inputs.statix.defaultPackage."x86_64-linux"
      findutils
    ] ./nix-lint.sh "";
    exePath = "";
  };
}
