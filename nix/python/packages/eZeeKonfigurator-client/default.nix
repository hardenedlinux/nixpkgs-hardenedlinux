{
  lib,
  fetchFromGitHub,
  python3Packages,
  nixpkgs-hardenedlinux-python-sources,
  machlib,
  broker38,
}: let
  eZeeKonfigurator_client-requirements = machlib.mkPython rec {
    requirements =
      builtins.readFile (
        nixpkgs-hardenedlinux-python-sources.eZeeKonfigurator_client.src
        + "/brokerd/requirements.txt"
      )
      + ''

      '';
  };
in
  python3Packages.buildPythonPackage rec {
    inherit
      (nixpkgs-hardenedlinux-python-sources.eZeeKonfigurator_client)
      pname
      version
      src
      ;
    propagatedBuildInputs = with python3Packages; [eZeeKonfigurator_client-requirements broker38];
    patches = [./version.patch];
    postPatch = ''
    '';
    meta = with lib; {
      description = "client-side half of eZeeKonfigurator";
      homepage = "https://github.com/esnet/eZeeKonfigurator_client";
    };
  }
