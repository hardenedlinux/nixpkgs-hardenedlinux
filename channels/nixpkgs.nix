{
  self,
  inputs,
  ...
}: {
  input = inputs.nixpkgs;
  overlaysBuilder = channels:
    [
      (import ../packages/inputs-packages.nix {inherit inputs;})
      (import ../packages/pkgs/nixos-tests.nix {inherit inputs;})
      (import ../packages/pkgs)
      (import ../packages/python)
      (import ../packages/go)
      (
        final: prev: {
          __dontExport = true;
          inherit
            (channels.latest)
            treefmt
            ;
          org-roam-publish = inputs.org-roam-book-template.packages.${prev.system}.default.override {
            org = ../docs/org;
          };

          mkdoc = prev.writeShellScriptBin "mkdoc" ''
            rsync -avzh ${final.org-roam-publish}/* docs/publish
            cd docs/publish && cp ../config.toml .
            hugo "$@"
            cp -rf --no-preserve=mode,ownership public/posts/index.html ./public/
          '';
        }
      )
    ]
    ++ (self.lib.importOverlays ./overlays/nixpkgs);
}
