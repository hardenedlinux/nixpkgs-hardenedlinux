{ self
, inputs
, ...
}:
{
  input = inputs.nixpkgs;
  overlaysBuilder = channels: [
    inputs.nvfetcher.overlay
    (import ../packages/inputs-packages.nix { inherit inputs; })
    (import ../packages/pkgs/nixos-tests.nix { inherit inputs; })
    (import ../packages/pkgs)
    (import ../packages/python-pkgs)
  ];
}
