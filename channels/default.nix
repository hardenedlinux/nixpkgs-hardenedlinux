{
  self,
  inputs,
  ...
}: {
  nixpkgs = import ./nixpkgs.nix {inherit self inputs;};
  latest = import ./latest.nix {inherit self inputs;};
  # nixpkgs_21_05 = import ./nixpkgs_21_05.nix { inherit self inputs; };
}
