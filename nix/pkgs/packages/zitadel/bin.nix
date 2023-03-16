{
  nixpkgs-hardenedlinux-sources,
  stdenv,
  lib,
}:
stdenv.mkDerivation {
  inherit (nixpkgs-hardenedlinux-sources.zitadel-bin) pname src version;

  sourceRoot = ".";

  installPhase = ''
    install -m755 -D zitadel $out/bin/zitadel
  '';

  meta = with lib; {
    homepage = "https://zitadel.com/";
    description = "The best of Auth0 and Keycloak combined.";
    platforms = platforms.linux;
  };
}
