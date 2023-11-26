{
  system,
  nixpkgs-hardenedlinux-sources,
  crane,
  pkg-config,
  openssl,
  rust-bin,
  python3,
}:
let
  craneLib = crane.overrideScope' (
    final: prev:
    let
      rust = rust-bin.nightly.latest.default;
    in
    {
      rust = rust;
      cargo = rust;
    }
  );
in
craneLib.buildPackage {
  buildInputs = [
    pkg-config
    openssl.dev
    python3
  ];
  inherit (nixpkgs-hardenedlinux-sources.gptcommit) src pname version;
  doCheck = false;
}
