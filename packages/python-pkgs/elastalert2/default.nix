{ lib
, python3Packages
, fetchgit
, python3
, nixpkgs-hardenedlinux-sources
, machlib
}:

let
  elastalert2-requirements = machlib.mkPython rec {
    requirements = builtins.readFile (nixpkgs-hardenedlinux-sources.elastalert2.src + "/requirements.txt");
  };
in
python3Packages.buildPythonPackage rec {

  inherit (nixpkgs-hardenedlinux-sources.elastalert2) pname version src;

  propagatedBuildInputs = with python3Packages; [
    elastalert2-requirements
  ];

  doCheck = false;

  postPatch = ''
    # substituteInPlace
    # --replace "" ""
  '';

  meta = with lib; {
    description = "ElastAlert 2 is a continuation of the original yelp/elastalert project. Pull requests are appreciated!";
    homepage = "https://github.com/jertel/elastalert2";
    license = "Apache-2.0";
  };
}
