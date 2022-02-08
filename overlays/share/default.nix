{ inputs }:
final: prev: {
  __dontExport = true;
  #Python overlay
  machlib = import inputs.mach-nix {
    pkgs = prev;
    pypiData = inputs.pypi-deps-db;
  };

  nixpkgs-hardenedlinux-sources = prev.callPackage ../../packages/_sources/generated.nix { };
}
