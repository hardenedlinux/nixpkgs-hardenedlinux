{
  stdenv,
  lib,
  python3,
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
    python = python3;
    projectDir = ./.;
    src = nixpkgs-hardenedlinux-sources.cowait.src;
    overrides = [poetry2nix.defaultPoetryOverrides customOverrides];
    __isBootstrap = true;
    doCheck = false;
  }
