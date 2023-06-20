{
  installApp,
  fetchurl
}:
installApp {
  pname = "ilograph-dmg";
  version = "1.5.3";
  src = fetchurl {
    url = "https://www.ilograph.com/desktop/release/Ilograph%20Desktop-1.5.3-arm64.dmg";
    sha256 = "sha256-xKwDRD9v3WwKDIo5FU1l1RDEhUFS5IKS1hCISn7q/CE=";
  };
  sourceRoot = "Ilograph Desktop.app";
}
