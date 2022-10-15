{
  stdenv,
  buildGoApplication,
  nixpkgs-hardenedlinux-go-sources,
  update,
}:
buildGoApplication rec {
  inherit (nixpkgs-hardenedlinux-go-sources.nvdtools) pname version src;
  modules = ./gomod2nix.toml;

  subPackages = ["cmd/*"];

  passthru.update = update.gomod2nix {
    inherit src;
    path = builtins.baseNameOf ./.;
  };
  meta = {
    description = "A set of tools to work with the feeds (vulnerabilities, CPE dictionary etc.) distributed by National Vulnerability Database (NVD)";
    homepage = "https://github.com/facebookincubator/nvdtools";
  };
}
