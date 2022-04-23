{inputs}: final: prev: {
  __dontExport = true;
  mach-nix = inputs.mach-nix.lib."${prev.stdenv.hostPlatform.system}";
}
