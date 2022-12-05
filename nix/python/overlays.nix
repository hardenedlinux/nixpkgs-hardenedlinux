{
  inputs,
  cell,
}: let
  packages = selfPythonPackages: pythonPackages: {
    polars = selfPythonPackages.callPackage ./packages/polars {};
    zed-python = selfPythonPackages.callPackage ./packages/zed {};
    elastalert2 = selfPythonPackages.callPackage ./packages/elastalert2 {};
    btest = selfPythonPackages.callPackage ./packages/btest {};
    zeekscript = selfPythonPackages.callPackage ./packages/zeekscript {};
    py-tree-sitter = selfPythonPackages.callPackage ./packages/py-tree-sitter {};
    vault-cli = selfPythonPackages.callPackage ./packages/vault-cli {};
    aim = selfPythonPackages.callPackage ./packages/aim {};
    fastai = selfPythonPackages.callPackage ./packages/fastai {};
    sh = selfPythonPackages.callPackage ./packages/sh {};
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
