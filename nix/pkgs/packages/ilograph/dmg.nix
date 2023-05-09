{installApp, nixpkgs-hardenedlinux-sources}:

installApp {
  inherit (nixpkgs-hardenedlinux-sources.ilograph-dmg) pname version src;
}
