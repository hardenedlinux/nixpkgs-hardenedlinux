{ buildGoApplication, nixpkgs-hardenedlinux-sources }:

buildGoApplication rec {
  inherit (nixpkgs-hardenedlinux-sources.zed) pname src version;

  modules = ./gomod2nix.toml;

  subPackages = [ "cmd/zed" ];

  meta = {
    description = "Search and analysis tooling for structured logs";
    homepage = "https://github.com/brimdata/zed";
  };
}
