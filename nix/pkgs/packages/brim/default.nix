{
  stdenv,
  fetchurl,
  gsettings-desktop-schemas,
  libdrm,
  glib,
  gtk3,
  cairo,
  atk,
  gdk-pixbuf,
  at-spi2-atk,
  dbus,
  dconf,
  xorg,
  nss,
  nspr,
  alsa-lib,
  cups,
  fontconfig,
  expat,
  lib,
  mesa,
  wrapGAppsHook,
  autoPatchelfHook,
  makeWrapper,
  dpkg,
  libudev0-shim,
  glibc,
  libsecret,
  nixpkgs-hardenedlinux-pkgs-sources,
}:
stdenv.mkDerivation rec {
  inherit (nixpkgs-hardenedlinux-pkgs-sources.brim) pname version src;
  buildInputs = [
    gsettings-desktop-schemas
    libdrm
    mesa.drivers.dev
    glib
    gtk3
    cairo
    atk
    gdk-pixbuf
    at-spi2-atk
    dbus
    dconf
    xorg.libX11
    xorg.libxcb
    xorg.libXi
    xorg.libXcursor
    xorg.libXdamage
    xorg.libXrandr
    xorg.libXcomposite
    xorg.libXext
    xorg.libXfixes
    xorg.libXrender
    xorg.libXtst
    xorg.libXScrnSaver
    xorg.libxshmfence
    nss
    nspr
    alsa-lib
    cups
    fontconfig
    expat
  ];
  nativeBuildInputs = [wrapGAppsHook autoPatchelfHook makeWrapper dpkg];
  unpackPhase = "dpkg-deb --fsys-tarfile $src | tar -x --no-same-permissions --no-same-owner";
  installPhase = ''
    runHook preInstall

    mkdir -p $out/{bin,share/Brim,lib}

    mv opt/Brim/* $out/share/Brim
    mv $out/share/Brim/*.so $out/lib/
    mv usr/share/* $out/share/

    substituteInPlace $out/share/applications/brim.desktop  \
      --replace "/opt/Brim/brim %U" "$out/bin/brim $U"

    runHook postInstall
  '';
  dontWrapGApps = true;
  runtimeLibs = lib.makeLibraryPath [libudev0-shim glibc libsecret nss];
  preFixup = ''
    makeWrapper $out/share/Brim/brim $out/bin/brim \
      --prefix LD_LIBRARY_PATH : "${runtimeLibs}" \
      "''${gappsWrapperArgs[@]}"
  '';
  enableParallelBuilding = true;
  meta = with lib; {
    description = "Desktop application to efficiently search large packet captures and Zeek logs.";
    homepage = "https://github.com/brimdata/brim";
    license = licenses.bsd3;
    platforms = with platforms; linux;
  };
}
