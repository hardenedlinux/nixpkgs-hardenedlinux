{ inputs }:
final: prev: {
  __dontExport = true;
  #Python overlay
  mach-nix = inputs.mach-nix.lib."${prev.stdenv.hostPlatform.system}";
  nixpkgs-hardenedlinux-sources = prev.callPackage ../../packages/_sources/generated.nix { };
}
