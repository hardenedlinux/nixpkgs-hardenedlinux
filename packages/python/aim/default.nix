{
  lib,
  fetchFromGitHub,
  python3Packages,
  nixpkgs-hardenedlinux-sources,
  mach-nix,
}: let
  aim-requirements = mach-nix.mkPython rec {
    requirements = ''
      # aim-ui==${nixpkgs-hardenedlinux-sources.aim.version}
      aim-ui
      Cython==3.0.0a9
      aimrecords==0.0.7
      aimrocks==0.1.0
      cachetools>=4.0.0
      click>=7.0
      cryptography>=3.0
      filelock>=3.0.0
      numpy>=1.12.0
      protobuf>=3.11.0
      psutil>=5.6.7
      py3nvml>=0.2.5
      RestrictedPython>=5.1
      tqdm>=4.20.0
      aiofiles>=0.5.0
      alembic>=1.4.0
      fastapi>=0.65.0
      jinja2>=2.10.0
      pytz>=2019.1
      SQLAlchemy>=1.4.1
      uvicorn>=0.12.0
      Pillow>=8.0.0
      grpcio==1.42.0
      # fastapi to support python3.6
      async-exit-stack>=1.0.0
      async-generator>=1.0
      packaging>=19.0
      GitPython>=3.0.4
    '';
  };
in
  python3Packages.buildPythonPackage rec {
    inherit (nixpkgs-hardenedlinux-sources.aim) pname version src;
    nativeBuildInputs = with python3Packages; [];
    propagatedBuildInputs = with python3Packages; [aim-requirements];
    postPatch = ''
      substituteInPlace setup.py \
      --replace "aim-ui=={__version__}" "aim-ui" \
      --replace "fastapi>=0.65.0,<0.68.0" "fastapi"
    '';
    doCheck = false;
    meta = with lib; {
      description = "Aim — an easy-to-use and performant open-source experiment tracker.";
      homepage = "https://github.com/aimhubio/aim";
    };
  }
