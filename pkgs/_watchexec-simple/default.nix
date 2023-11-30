{
  system,
  nixpkgs-hardenedlinux-sources,
  crane,
}:
let
  craneLib = crane.overrideScope' (final: prev: {
    rust = rust-stable;
  });
in
craneLib.buildPackage {
  inherit (nixpkgs-hardenedlinux-sources.watchexec-simple) src pname version;
}
