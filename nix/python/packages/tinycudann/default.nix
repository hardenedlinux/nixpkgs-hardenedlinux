{
  stdenv,
  lib,
  buildPythonPackage,
  nixpkgs-hardenedlinux-python-sources,
  python,
  python3,
  torch,
}:
buildPythonPackage {
  inherit (nixpkgs-hardenedlinux-python-sources.tiny-cuda-nn) pname src version;

  preConfigure = ''
    cd bindings/torch
  '';

  propagatedBuildInputs = [
    torch
  ];

  meta = with lib; {
    description = "A tiny CUDA neural network library";
    homepage = "https://github.com/NVlabs/tiny-cuda-nn/tree/master/bindings/tiny-cuda-nn";
    license = licenses.bsd3; # bsd3Clause
  };
}
