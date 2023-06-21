{
  lib,
  pythonPackages,
  nixpkgs-hardenedlinux-python-sources,
}:
pythonPackages.buildPythonPackage rec {
  inherit (nixpkgs-hardenedlinux-python-sources.cliche) pname version src;

  checkInputs = with pythonPackages; [pytestCheckHook];

  patches = [./nix-cliche.patch];

  doCheck = true;

  propagatedBuildInputs = with pythonPackages; [ipdb argcomplete];

  postPatch = ''
    substituteInPlace setup.py \
      --replace "ipdb == 0.13.9" "ipdb"
  '';
  meta = with lib; {
    description = "Build a simple command-line interface from your functions 💻";
    homepage = "https://github.com/kootenpv/cliche";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
