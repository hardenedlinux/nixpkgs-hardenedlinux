{
  stdenv,
  buildGoApplication,
  nixpkgs-hardenedlinux-sources,
  update-scripts,
}:
buildGoApplication rec {
  inherit (nixpkgs-hardenedlinux-sources.nvdtools) pname version src;
  modules = ./gomod2nix.toml;

  subPackages = [ "cmd/*" ];

  passthru.update = update-scripts.gomod2nix {
    inherit src;
    path = builtins.baseNameOf ./.;
  };
  meta = {
    description = "A set of tools to work with the feeds (vulnerabilities, CPE dictionary etc.) distributed by National Vulnerability Database (NVD)";
    homepage = "https://github.com/facebookincubator/nvdtools";
  };
}
