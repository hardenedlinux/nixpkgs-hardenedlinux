{ buildGoApplication
, nixpkgs-hardenedlinux-sources
}:
buildGoApplication rec {
  inherit (nixpkgs-hardenedlinux-sources.ghq) pname src version;
  modules = ./gomod2nix.toml;
  subPackages = [ "." ];
  doCheck = false;
  meta = {
    description = "About Remote repository management made easy";
    homepage = "https://github.com/x-motemen/ghq";
  };
}
