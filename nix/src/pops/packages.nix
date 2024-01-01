{
  omnibus,
  inputs,
  system,
  projectDir,
  eachSystem,
  super,
}:
eachSystem (
  system:
  let
    loadInputs = (super.subflake.setSystem system).inputs;
    nixpkgs = loadInputs.nixpkgs.appendOverlays [
      loadInputs.nix-npm-buildpackage.overlays.default
      loadInputs.gomod2nix.overlays.default
      loadInputs.rust-overlay.overlays.default
      loadInputs.crane.overlays.default
      loadInputs.pnpm2nix.overlays.default
      (final: prev: {
        crane = loadInputs.crane.mkLib final;
        nixpkgs-hardenedlinux-sources = (importNvfetch "pkgs") // (importNvfetch "go");
        nixpkgs-hardenedlinux-python-sources = (importNvfetch "python");
      })
    ];
    importNvfetch =
      subPath:
      import (projectDir + "/nix/nvfetcher/${subPath}/generated.nix") {
        inherit (nixpkgs)
          fetchgit
          fetchurl
          fetchFromGitHub
          dockerTools
          ;
      };
  in
  (omnibus.pops.packages {
    src = projectDir + "/pkgs";
    inputs = {
      inputs = {
        inherit nixpkgs;
      };
    };
  })
)
