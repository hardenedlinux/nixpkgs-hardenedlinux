{
  stdenv,
  lib,
  buildPythonPackage,
  nixpkgs-hardenedlinux-python-sources,
  python,
  coverage,
  lsof,
  glibcLocales,
}:
buildPythonPackage rec {
  inherit (nixpkgs-hardenedlinux-python-sources.sh) pname src version;

  postPatch = ''
    sed -i 's#/usr/bin/env python#${python.interpreter}#' test.py
  '';

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
