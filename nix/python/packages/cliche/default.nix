{
  lib,
  pythonPackages,
  nixpkgs-hardenedlinux-python-sources,
}:
pythonPackages.buildPythonPackage rec {
  inherit (nixpkgs-hardenedlinux-python-sources.cliche) pname version src;
  doCheck = false;
  propagatedBuildInputs = with pythonPackages; [ipdb];
  meta = with lib; {
    description = "Build a simple command-line interface from your functions 💻";
    homepage = "https://github.com/kootenpv/cliche";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
