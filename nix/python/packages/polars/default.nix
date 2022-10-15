{
  lib,
  stdenv,
  buildPythonPackage,
  pythonOlder,
  libiconv,
  fetchzip,
  rust-bin,
  makeRustPlatform,
  python3Packages,
  fetchFromGitHub,
  ...
}: let
  version = "0.14.18";
  source = fetchFromGitHub {
    owner = "pola-rs";
    repo = "polars";
    rev = "py-v${version}";
    sha256 = "sha256-nXYQ7vwVD4WJrSsBATuqj5cGdpFKLvi1S4EpjBoSIKA=";
  };
  rustPlatform = makeRustPlatform {
    rustc = rust;
    cargo = rust;
  };
  rust = rust-bin.nightly.latest.default.override {
    extensions = ["rust-src"];
  };
in
  buildPythonPackage {
    inherit version;
    pname = "polars";
    format = "pyproject";
    src = source;

    sourceRoot = "source/py-polars";

    cargoDeps = rustPlatform.fetchCargoTarball {
      src = source;
      sourceRoot = "source/py-polars";
      name = "polars";
      sha256 = "sha256-AEoXHT74RRYC1hCNtnJQJHV8UMf7Rfni4s+cCdyn2mk=";
      patches = [./polars.patch];
    };

    patches = [./polars.patch];

    nativeBuildInputs = with rustPlatform; [
      cargoSetupHook
      maturinBuildHook
    ];
    meta.broken = false;
  }
