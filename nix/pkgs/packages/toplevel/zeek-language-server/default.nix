{
  nixpkgs-hardenedlinux-sources,
  tree-sitter,
  nodejs,
  crane,
}:
let
  craneLib = crane.overrideScope' (final: prev: { });
in
craneLib.buildPackage {
  inherit (nixpkgs-hardenedlinux-sources.zeek-language-server) src pname version;
  nativeBuildInputs = [
    tree-sitter
    nodejs
  ];
  doCheck = false;
}
# rustPlatform.buildRustPackage {
#   inherit (nixpkgs-hardenedlinux-sources.zeek-language-server) src pname version;
#   nativeBuildInputs = [tree-sitter nodejs];
#   doCheck = false;
#   cargoSha256 = "sha256-mkfB+Yz3D4XtaYkV59yBSumDkMld58RLqjPz7a2A2ls=";
# }
