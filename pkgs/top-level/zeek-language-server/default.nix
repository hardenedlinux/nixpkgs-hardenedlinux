{
  system,
  nixpkgs-hardenedlinux-sources,
  rustPlatform,
  tree-sitter,
  nodejs,
}: let
in
  rustPlatform.buildRustPackage {
    inherit (nixpkgs-hardenedlinux-sources.zeek-language-server) src pname version;
    nativeBuildInputs = [tree-sitter nodejs];
    doCheck = false;
    cargoSha256 = "sha256-mkfB+Yz3D4XtaYkV59yBSumDkMld58RLqjPz7a2A2ls=";
  }
