{
  stdenv,
  lib,
  buildPythonPackage,
  nixpkgs-hardenedlinux-python-sources,
  python,
  coverage,
  lsof,
  glibcLocales,
  poetry-core,
}:
buildPythonPackage rec {
  pyproject = true;

  inherit (nixpkgs-hardenedlinux-python-sources.sh) pname src version;

  propagatedBuildInputs = [ poetry-core ];
  checkInputs = [
    coverage
    lsof
    glibcLocales
  ];

  preCheck = ''
    export LC_ALL="en_US.UTF-8"
    HOME=$(mktemp -d)
  '';

  doCheck = false;

  meta = with lib; {
    description = "Python subprocess interface";
    homepage = "https://pypi.python.org/pypi/sh/";
    license = licenses.mit;
  };
}
