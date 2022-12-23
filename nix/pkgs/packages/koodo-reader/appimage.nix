{
  lib,
  stdenv,
  fetchurl,
  appimageTools,
  nixpkgs-hardenedlinux-pkgs-sources,
}: let
  pname = "koodo-reader";
  appimageContents = appimageTools.extractType2 {
    inherit pname;
    inherit (nixpkgs-hardenedlinux-pkgs-sources.koodo-reader-appimage) version src;
  };
in
  appimageTools.wrapType2 rec {
    inherit pname;
    inherit (nixpkgs-hardenedlinux-pkgs-sources.koodo-reader-appimage) version src;

    extraPkgs = pkgs:
      with pkgs; [];

    extraInstallCommands = ''
      mv $out/bin/${pname}-${version} $out/bin/${pname}
      install -m 444 -D ${appimageContents}/${pname}.desktop $out/share/applications/koodo-reader.desktop
      substituteInPlace $out/share/applications/koodo-reader.desktop \
        --replace 'Exec=AppRun' 'Exec=${pname}'
    '';

    meta = with lib; {
      description = "A modern ebook manager and reader with sync and backup capacities for Windows, macOS, Linux and Web";
      homepage = "https://github.com/troyeguo/koodo-reader";
      license = licenses.agpl3;
      platforms = platforms.linux;
    };
  }
