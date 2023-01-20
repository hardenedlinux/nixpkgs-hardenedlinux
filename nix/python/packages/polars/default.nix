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
  version = "0.15.9";
  source = fetchFromGitHub {
    owner = "pola-rs";
    repo = "polars";
    rev = "py-${version}";
    sha256 = "sha256-WE/Wt+yoV30OUXBsEaVGKYNo8IMB/Ixibe2JAUt4Wpw=";
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
      sha256 = "sha256-vvbvT2mr/hr/r5tOQdMOtr6Z0PO+UC2ZzvanL3LIEhw=";
    };

    nativeBuildInputs = with rustPlatform; [
      cargoSetupHook
      maturinBuildHook
    ];
    meta.broken = false;
  }
