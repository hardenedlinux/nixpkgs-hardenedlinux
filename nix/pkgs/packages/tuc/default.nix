{
  dream2nix,
  system,
  nixpkgs-hardenedlinux-pkgs-sources,
  crane,
}: let
  craneLib = crane.overrideScope' (final: prev: {});
in
  craneLib.buildPackage {
    inherit (nixpkgs-hardenedlinux-pkgs-sources.tuc) src pname version;
  }
