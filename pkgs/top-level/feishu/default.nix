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
  alsaLib,
  cups,
  fontconfig,
  expat,
  lib,
  mesa_drivers,
  wrapGAppsHook,
  autoPatchelfHook,
  makeWrapper,
  dpkg,
  libudev0-shim,
  glibc,
  libsecret,
  nixpkgs-hardenedlinux-sources,
}: let
  version = "5.9.18";
in
  stdenv.mkDerivation rec {
    pname = "feishu";

    inherit version;

    src = fetchurl {
      url = "https://sf3-cn.feishucdn.com/obj/ee-appcenter/5db94058d7ad/Feishu-linux_x64-${version}.deb";
      sha256 = "sha256-/7KbWhhLAl1OTqRoqPaEpwZ6tb/UWGerw3Dlm+Y4ksc=";
    };

    buildInputs = [
      gsettings-desktop-schemas
      libdrm
      mesa_drivers.dev
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
      alsaLib
      cups
      fontconfig
      expat
    ];
    nativeBuildInputs = [wrapGAppsHook autoPatchelfHook makeWrapper dpkg];
    unpackPhase = "dpkg-deb --fsys-tarfile $src | tar -x --no-same-permissions --no-same-owner";
    installPhase = ''
      runHook preInstall

      mkdir -p $out/{bin,share/feishu,lib}

      mv opt/bytedance/feishu/* $out/share/feishu
      mv usr/share/* $out/share/

      substituteInPlace $out/share/applications/bytedance-feishu.desktop  \
        --replace "/usr/bin/bytedance-feishu-stable %U" "$out/bin/feishu $U"

      runHook postInstall
    '';

    dontWrapGApps = true;

    runtimeLibs = lib.makeLibraryPath [libudev0-shim glibc libsecret nss];

    preFixup = ''
      makeWrapper $out/share/feishu/feishu $out/bin/feishu \
        --prefix LD_LIBRARY_PATH : "${runtimeLibs}" \
        "''${gappsWrapperArgs[@]}"
    '';
    enableParallelBuilding = true;
  }
