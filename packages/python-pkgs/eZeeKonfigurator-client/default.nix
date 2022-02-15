{
  lib,
  fetchFromGitHub,
  python3Packages,
  nixpkgs-hardenedlinux-sources,
  mach-nix,
  broker38,
}:
let
  eZeeKonfigurator_client-requirements = mach-nix.mkPython rec {
    requirements =
      builtins.readFile (
        nixpkgs-hardenedlinux-sources.eZeeKonfigurator_client.src
        + "/brokerd/requirements.txt"
      )
      + ''

      '';
  };
in
python3Packages.buildPythonPackage rec {
  inherit
    (nixpkgs-hardenedlinux-sources.eZeeKonfigurator_client)
    pname
    version
    src
    ;
  propagatedBuildInputs =
    with python3Packages; [ eZeeKonfigurator_client-requirements broker38 ];
  patches = [ ./version.patch ];
  postPatch = ''
  '';
  meta =
    with lib; {
      description = "client-side half of eZeeKonfigurator";
      homepage = "https://github.com/esnet/eZeeKonfigurator_client";
    };
}
