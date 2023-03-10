{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/6ccc4a59c3f1b56d039d93da52696633e641bc71";
  };
  inputs = {
    poetry2nix.url = "github:nix-community/poetry2nix";
    poetry2nix.inputs.nixpkgs.follows = "nixpkgs";

    gomod2nix.url = "github:tweag/gomod2nix";
    gomod2nix.inputs.nixpkgs.follows = "nixpkgs";

    xnlib.url = "github:gtrunsec/xnlib";

    crane.url = "github:ipetkov/crane";
    crane.inputs.nixpkgs.follows = "nixpkgs";

    nix-npm-buildpackage.url = "github:serokell/nix-npm-buildpackage";
    nix-npm-buildpackage.inputs.nixpkgs.follows = "nixpkgs";

    dream2nix.url = "github:nix-community/dream2nix";
    dream2nix.inputs.nixpkgs.follows = "nixpkgs";

    rust-overlay.url = "github:oxalica/rust-overlay";
    rust-overlay.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = {self, ...}: {};
}
