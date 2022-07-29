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
    cargoSha256 = "sha256-0F32NlqItkkVq+Madorxyb30RQPOS/+xX6PAIcMh+tc=";
  }
