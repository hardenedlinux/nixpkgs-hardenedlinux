{
  buildGoApplication,
  nixpkgs-hardenedlinux-sources,
  update-scripts,
}:
buildGoApplication rec {
  inherit (nixpkgs-hardenedlinux-sources.container-structure-test)
    pname
    src
    version
    ;
  modules = ./gomod2nix.toml;
  subPackages = [ "cmd/*" ];
  meta = {
    description = "validate the structure of your container images";
    homepage = "https://github.com/GoogleContainerTools/container-structure-test";
  };
  passthru.update = update-scripts.gomod2nix {
    inherit src;
    path = builtins.baseNameOf ./.;
  };
}
