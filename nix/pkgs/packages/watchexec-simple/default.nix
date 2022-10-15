{
  system,
  nixpkgs-hardenedlinux-pkgs-sources,
  crane,
}: let
  craneLib = crane.overrideScope' (final: prev: {});
in
  craneLib.buildPackage {
    inherit (nixpkgs-hardenedlinux-pkgs-sources.watchexec-simple) src pname version;
  }
