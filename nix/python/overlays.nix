{
  inputs,
  cell,
}: {
  default = final: prev: {
    nixpkgs-hardenedlinux-python-sources = prev.callPackage ./packages/_sources/generated.nix {};

    python3Packages =
      prev.python3Packages.override
      (
        old: {
          overrides = prev.lib.composeExtensions (old.packageOverrides or (_: _: {})) (selfPythonPackages: pythonPackages: let
          in {
            polars = selfPythonPackages.callPackage ./packages/polars {};
            zed-python = prev.python3Packages.callPackage ./packages/zed {};
            elastalert2 = prev.python3Packages.callPackage ./packages/elastalert2 {};
            btest = prev.python3Packages.callPackage ./packages/btest {};
            zeekscript = prev.python3Packages.callPackage ./packages/zeekscript {};
            py-tree-sitter = prev.python3Packages.callPackage ./packages/py-tree-sitter {};
            vault-cli = prev.python3Packages.callPackage ./packages/vault-cli {};
            aim = prev.python3Packages.callPackage ./packages/aim {};
            sh = prev.python3Packages.callPackage ./packages/sh {};
          });
        }
      );
  };
}
