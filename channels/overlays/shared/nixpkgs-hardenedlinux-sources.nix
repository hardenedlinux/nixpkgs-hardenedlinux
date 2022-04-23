final: prev: {
  nixpkgs-hardenedlinux-sources =
    prev.callPackage ../../../packages/_sources/default/generated.nix {}
    // (prev.callPackage ../../../packages/_sources/go/generated.nix {});
}
