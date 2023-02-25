{
  dream2nix,
  system,
  nixpkgs-hardenedlinux-pkgs-sources,
  crane,
  pkg-config,
  openssl,
  rust-bin,
}: let
  craneLib = crane.overrideScope' (final: prev: let
    rust = rust-bin.nightly.latest.default;
  in {
    rust = rust;
    cargo = rust;
  });
in
  craneLib.buildPackage {
    buildInputs = [pkg-config openssl.dev];
    inherit (nixpkgs-hardenedlinux-pkgs-sources.gptcommit) src pname version;
  }
