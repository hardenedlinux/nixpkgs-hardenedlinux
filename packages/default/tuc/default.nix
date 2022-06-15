{
  dream2nix,
  system,
  nixpkgs-hardenedlinux-sources,
  crane,
}: let
  craneLib = crane.overrideScope' (final: prev: {});
in
  craneLib.buildPackage {
    inherit (nixpkgs-hardenedlinux-sources.tuc) src pname version;
  }
# (dream2nix.makeFlakeOutputs {
#   systems = [system];
#   config.projectRoot = nixpkgs-hardenedlinux-sources.tuc.src;
#   source = nixpkgs-hardenedlinux-sources.tuc.src;
# })
# .packages
# .${system}
# .tuc

