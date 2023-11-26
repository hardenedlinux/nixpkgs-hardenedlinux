{
  stdenv,
  lib,
  python3Packages,
  nixpkgs-hardenedlinux-python-sources,
  tree-sitter,
}:
python3Packages.buildPythonPackage rec {
  inherit (nixpkgs-hardenedlinux-python-sources.py-tree-sitter) pname src version;
  propagatedBuildInputs = with python3Packages; [ tree-sitter ];
  doCheck = false;
  meta = with lib; {
    description = "Python bindings to the Tree-sitter parsing library";
    homepage = "https://github.com/tree-sitter/py-tree-sitter";
    license = licenses.mit;
  };
}
