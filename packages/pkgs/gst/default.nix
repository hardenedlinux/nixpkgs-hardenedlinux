{ buildGoApplication, nixpkgs-hardenedlinux-sources }:

buildGoApplication rec {

  inherit (nixpkgs-hardenedlinux-sources.gst) pname src version;

  modules = ./gomod2nix.toml;

  subPackages = [ "." ];

  doCheck = false;

  meta = {
    description = "👻 Supercharge your ghq workflow.";
    homepage = "https://github.com/uetchy/gst";
  };
}
