{
  inputs,
  cell,
}: let
  packages = selfPythonPackages: pythonPackages: {
    polars = pythonPackages.polars.overridePythonAttrs (old: rec {
      inherit (pythonPackages.pkgs.nixpkgs-hardenedlinux-python-sources.polars) src version pname;
      cargoDeps = pythonPackages.pkgs.rustPlatform.fetchCargoTarball {
        inherit src;
        preBuild = ''
          cd py-polars
        '';
        name = "${pname}-${version}";
        sha256 = "sha256-tmGhSNpp7fQdVTfB65eHeoyKBIdn8E24DTzjuZNKaec=";
      };
      enableParallelBuilding = true;
      preBuild = ''
        cd py-polars
        sed -i 's/version = "0.15.17"/version = "0.15.18"/g' Cargo.lock
      '';
    });
    zed-python = selfPythonPackages.callPackage ./packages/zed {};
    # elastalert2 = selfPythonPackages.callPackage ./packages/elastalert2 {};
    btest = selfPythonPackages.callPackage ./packages/btest {};
    zeekscript = selfPythonPackages.callPackage ./packages/zeekscript {};
    py-tree-sitter = selfPythonPackages.callPackage ./packages/py-tree-sitter {};
    vault-cli = selfPythonPackages.callPackage ./packages/vault-cli {};
    # aim = selfPythonPackages.callPackage ./packages/aim {};
    fastai = selfPythonPackages.callPackage ./packages/fastai {};
    pysh = selfPythonPackages.callPackage ./packages/sh {};
    tinycudann = selfPythonPackages.callPackage ./packages/tinycudann {
      torch = pythonPackages.torch.override {cudaSupport = true;};
    };
  };
in {
  default = final: prev: {
    nixpkgs-hardenedlinux-python-sources = prev.callPackage ./packages/_sources/generated.nix {};

    python3 =
      prev.python3.override
      (
        old: {
          packageOverrides =
            prev.lib.composeExtensions (old.packageOverrides or (_: _: {})) packages;
        }
      );

    python3Packages =
      prev.python3Packages.override
      (
        old: {
          overrides = prev.lib.composeExtensions (old.packageOverrides or (_: _: {})) packages;
        }
      );
  };
  inherit packages;
}
