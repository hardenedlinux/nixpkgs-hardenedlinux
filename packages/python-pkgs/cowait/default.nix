{
  stdenv,
  lib,
  python3Packages,
  nixpkgs-hardenedlinux-sources,
  poetry2nix,
}: let
  customOverrides = self: super: {
    aiohttp-middlewares = super.aiohttp-middlewares.overridePythonAttrs (
      old: {
        propagatedBuildInputs = old.propagatedBuildInputs ++ [super.poetry];
      }
    );
  };
in
  poetry2nix.mkPoetryApplication rec {
    inherit (nixpkgs-hardenedlinux-sources.cowait) pname src version;
    projectDir = src;
    overrides = [poetry2nix.defaultPoetryOverrides customOverrides];
    doCheck = false;
    meta = with lib; {
      description = "Containerized distributed programming framework for Python";
      homepage = "https://github.com/backtick-se/cowait";
      license = licenses.asl20;
    };
  }
