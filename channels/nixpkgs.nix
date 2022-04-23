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
          inherit
            (channels.latest)
            treefmt
            ;
        }
      )
    ]
    ++ (self.lib.importOverlays ./overlays/nixpkgs);
}
