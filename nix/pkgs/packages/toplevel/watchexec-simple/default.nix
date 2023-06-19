{
  system,
  nixpkgs-hardenedlinux-sources,
  crane,
}: let
  craneLib = crane.overrideScope' (final: prev: {});
in
  craneLib.buildPackage {
    inherit (nixpkgs-hardenedlinux-sources.watchexec-simple) src pname version;
  }
