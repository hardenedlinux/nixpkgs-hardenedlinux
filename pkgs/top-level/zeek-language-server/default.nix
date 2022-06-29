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
    cargoSha256 = "sha256-qUSUXqS8PvDYyhzqe+TeVGkc5HqfS1EnYzQ31dfW1Ew=";
  }
