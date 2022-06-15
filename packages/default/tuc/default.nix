{
  dream2nix,
  system,
  nixpkgs-hardenedlinux-sources,
}:
(dream2nix.makeFlakeOutputs {
  systems = [system];
  config.projectRoot = nixpkgs-hardenedlinux-sources.tuc.src;
  source = nixpkgs-hardenedlinux-sources.tuc.src;
})
.packages
.${system}
.tuc
