{
  stdenv,
  lib,
  python3Packages,
  nixpkgs-hardenedlinux-python-sources,
  py-tree-sitter,
}:
python3Packages.buildPythonPackage rec {
  inherit (nixpkgs-hardenedlinux-python-sources.zeekscript) pname src version;
  propagatedBuildInputs = with python3Packages; [py-tree-sitter];
  doCheck = false;
  meta = with lib; {
    description = "A toolchain to parse, analyze, and format Zeek scripts";
    homepage = "https://github.com/zeek/zeekscript";
    license = licenses.asl20;
  };
}
