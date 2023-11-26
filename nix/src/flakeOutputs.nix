{
  super,
  eachSystem,
  inputs,
  omnibus,
  projectDir,
}:
let
in
{
  packages = eachSystem (system: super.pops.packages.${system}.exports.derivations);
  scopedPackages = eachSystem (system: super.pops.packages.${system}.exports.packages);
  overlays = {
    inherit (super.pops.packages.x86_64-linux.exports.overlays) default compose;
  };
}
