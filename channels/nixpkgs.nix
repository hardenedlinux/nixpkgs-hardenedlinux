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
      (import ../packages/python-pkgs)
      (
        final: prev: {
          inherit
            (channels.latest)
            treefmt
            ;
        }
      )
    ]
    ++ (self.lib.importOverlays ../overlays/nixpkgs);
}
