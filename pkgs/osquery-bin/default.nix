{
  stdenv,
  lib,
  wrapGAppsHook,
  autoPatchelfHook,
  makeWrapper,
  dpkg,
  syslogng,
  nixpkgs-hardenedlinux-sources,
  __inputs__,
}:
stdenv.mkDerivation rec {
  inherit (nixpkgs-hardenedlinux-sources.osquery) pname version src;
  buildInputs = [ syslogng ];
  nativeBuildInputs = [
    wrapGAppsHook
    autoPatchelfHook
    makeWrapper
    dpkg
  ];
  runtimeLibs = lib.makeLibraryPath [ ];
  unpackPhase = "dpkg-deb --fsys-tarfile $src | tar -x --no-same-permissions --no-same-owner";
  installPhase = ''
    runHook preInstall

    mkdir -p $out

    mv opt/osquery/* $out
    mv {etc,var,usr/lib} $out

    runHook postInstall
  '';
  preFixup = ''
    gappsWrapperArgs+=(--prefix LD_LIBRARY_PATH : "${runtimeLibs}" )
  '';
  enableParallelBuilding = true;
  passthru.tests = { }; # osquery-vm-tests;
  meta = with lib; {
    description = "SQL powered operating system instrumentation, monitoring, and analytics.";
    homepage = "https://github.com/osquery/osquery";
    license = "SPDX-License-Identifier: Apache-2.0 OR GPL-2.0-only";
    platforms = with platforms; linux;
  };
}
