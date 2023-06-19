{
  writeScriptBin,
  gomod2nix,
}: {
  gomod2nix = {
    src,
    path,
  }:
    writeScriptBin "gomo2nix-update" ''
      ${gomod2nix}/bin/gomod2nix --dir ${src} --outdir $PRJ_ROOT/nix/pkgs/packages/toplevel/${path}
    '';
}
