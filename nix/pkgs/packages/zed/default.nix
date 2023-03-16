{
  buildGoApplication,
  nixpkgs-hardenedlinux-sources,
  go_1_19,
  update,
}:
buildGoApplication rec {
  inherit (nixpkgs-hardenedlinux-sources.zed) pname src version;
  modules = ./gomod2nix.toml;
  subPackages = ["cmd/*"];
  go = go_1_19;

  doCheck = false;

  meta = {
    description = "Search and analysis tooling for structured logs";
    homepage = "https://github.com/brimdata/zed";
  };

  passthru.update = update.gomod2nix {
    inherit src;
    path = builtins.baseNameOf ./.;
  };
}
