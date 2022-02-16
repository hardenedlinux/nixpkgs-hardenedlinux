{
  lib,
  python3Packages,
  nixpkgs-hardenedlinux-sources,
}:
let
  durationpy = python3Packages.buildPythonPackage {
    inherit (nixpkgs-hardenedlinux-sources.durationpy) pname src version;
    propagatedBuildInputs = with python3Packages; [ ];
    doCheck = false;
  };
in
python3Packages.buildPythonPackage rec {
  pname = "python-zed";
  inherit (nixpkgs-hardenedlinux-sources.zed) src version;
  propagatedBuildInputs =
    with python3Packages; [ requests python-dateutil durationpy ];
  doCheck = false;
  postPatch = ''
    cd python/zed
  '';
  meta =
    with lib; {
      description = "Search and analysis tooling for structured logs";
      homepage = "https://github.com/brimdata/zed/python/zqd";
      license = licenses.bsd3;
    };
}
