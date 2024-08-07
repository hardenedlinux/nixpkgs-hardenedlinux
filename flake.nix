{
  inputs = {
    omnibusSrc.url = "github:tao3k/omnibus";
    omnibusSrc.flake = false;
  };

  outputs =
    {
      self,
      omnibusSrc,
      nixpkgs,
      ...
    }@inputs:
    let
      omnibus = import omnibusSrc;
      eachSystem = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      srcPop = import ./nix/src { inherit inputs eachSystem omnibus; };
      src = srcPop.exports.default;
    in
    {
      inherit src;
      inherit (src.flakeOutputs) packages overlays scopedPackages;
    };
}
