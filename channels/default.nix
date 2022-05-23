{
  self,
  inputs,
  ...
} @ args: {
  nixpkgs = import ./nixpkgs.nix args;
  latest = import ./latest.nix args;
  nixpkgs_20 = import ./nixpkgs_20.nix args;
  nixpkgs_21 = import ./nixpkgs_21.nix args;
}
