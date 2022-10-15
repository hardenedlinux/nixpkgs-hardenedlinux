{
  writeScriptBin,
  gomod2nix,
}: {
  gomod2nix = {
    src,
    path,
  }:
    writeScriptBin "gomo2nix" ''
      ${gomod2nix}/bin/gomod2nix --dir ${src} --outdir $PRJ_ROOT/nix/go/packages/${path}
    '';
}
