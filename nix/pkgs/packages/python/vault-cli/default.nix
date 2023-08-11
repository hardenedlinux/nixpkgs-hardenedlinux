{
  stdenv,
  lib,
  python3Packages,
  nixpkgs-hardenedlinux-python-sources,
}:
python3Packages.buildPythonPackage rec {
  inherit (nixpkgs-hardenedlinux-python-sources.vault-cli) pname src version;
  propagatedBuildInputs = with python3Packages; [
    click
    pyyaml
    jinja2
    requests
    hvac
  ];
  checkInputs = with python3Packages; [ pytest ];
  postPatch = ''
    substituteInPlace setup.cfg \
    --replace "hvac<0.10.12" "hvac"
  '';
  meta = with lib; {
    description = "A configurable command-line interface tool (and python library) to interact with Hashicorp Vault";
    homepage = "https://github.com/peopledoc/vault-cli";
    license = licenses.asl20;
  };
}
