{ stdenv
, fetchurl
, gnome3
, libdrm
, glib
, gtk3
, cairo
, atk
, gdk-pixbuf
, at-spi2-atk
, dbus
, dconf
, xorg
, nss
, nspr
, alsaLib
, cups
, fontconfig
, expat
, lib
, mesa
, wrapGAppsHook
, autoPatchelfHook
, makeWrapper
, dpkg
, libudev0-shim
, glibc
, libsecret
, nixpkgs-hardenedlinux-sources
}:
stdenv.mkDerivation rec {
  inherit (nixpkgs-hardenedlinux-sources.brim) pname version src;

  buildInputs = [
    gnome3.gsettings_desktop_schemas
    libdrm
    mesa
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
    nss
    nspr
    alsaLib
    cups
    fontconfig
    expat
  ];

  nativeBuildInputs = [
    wrapGAppsHook
    autoPatchelfHook
    makeWrapper
    dpkg
  ];


  runtimeLibs = lib.makeLibraryPath [ libudev0-shim glibc libsecret ];

  unpackPhase = "dpkg-deb --fsys-tarfile $src | tar -x --no-same-permissions --no-same-owner";

  installPhase = ''
    runHook preInstall

    mkdir -p $out/{bin,share/Brim,lib}

    mv opt/Brim/* $out/share/Brim
    mv $out/share/Brim/*.so $out/lib/
    mv usr/share/* $out/share/
    ln -s $out/share/Brim/brim $out/bin/brim

    substituteInPlace $out/share/applications/brim.desktop  \
      --replace "/opt/Brim/brim %U" "$out/bin/brim $U"

    runHook postInstall
  '';

  preFixup = ''
    gappsWrapperArgs+=(--prefix LD_LIBRARY_PATH : "${runtimeLibs}" )
  '';

  enableParallelBuilding = true;

  meta = with lib; {
    description = "Desktop application to efficiently search large packet captures and Zeek logs.";
    homepage = "https://github.com/brimdata/brim";
    license = licenses.bsd3;
    platforms = with platforms; linux;
  };
}
