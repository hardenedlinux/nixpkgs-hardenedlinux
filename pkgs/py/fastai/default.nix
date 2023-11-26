{
  lib,
  fetchFromGitHub,
  python3,
  python3Packages,
  nixpkgs-hardenedlinux-python-sources,
}:
with python3.pkgs;
let
  fastcore = python3Packages.buildPythonPackage rec {
    inherit (nixpkgs-hardenedlinux-python-sources.fastcore) pname version src;
    propagatedBuildInputs = with python3Packages; [
      numpy
      packaging
    ];
    dontUseSetuptoolsCheck = true;
  };

  fastdownload = python3Packages.buildPythonPackage rec {
    inherit (nixpkgs-hardenedlinux-python-sources.fastdownload) pname version src;
    propagatedBuildInputs = with python3Packages; [
      packaging
      fastcore
      fastprogress
    ];
    dontUseSetuptoolsCheck = true;
  };

  fastprogress = python3Packages.buildPythonPackage rec {
    inherit (nixpkgs-hardenedlinux-python-sources.fastprogress) pname version src;
    doCheck = false;
    propagatedBuildInputs = with python3Packages; [ numpy ];
  };
in
python3Packages.buildPythonPackage rec {
  inherit (nixpkgs-hardenedlinux-python-sources.fastai) pname version src;
  propagatedBuildInputs = with python3Packages; [
    torch
    torchvision
    matplotlib
    pandas
    requests
    pyyaml
    pillow
    scikit-learn
    scipy
    spacy
    fastcore
    fastprogress
    fastdownload
  ];
  postPatch = ''
    substituteInPlace settings.ini \
     --replace "torch>=1.7,<1.14" "torch" \
     --replace "torchvision>=0.8.2" "torchvision"
  '';

  dontUseSetuptoolsCheck = true;

  meta = with lib; {
    description = "The fastai deep learning library";
    homepage = "https://github.com/fastai/fastai";
    license = licenses.asl20;
  };
}
