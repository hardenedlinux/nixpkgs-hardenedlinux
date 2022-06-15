{
  buildGoApplication,
  nixpkgs-hardenedlinux-sources,
  go_1_18,
  update-package,
}:
buildGoApplication rec {
  inherit (nixpkgs-hardenedlinux-sources.zed) pname src version;
  modules = ./gomod2nix.toml;
  subPackages = ["cmd/*"];
  go = go_1_18;

  doCheck = false;

  meta = {
    description = "Search and analysis tooling for structured logs";
    homepage = "https://github.com/brimdata/zed";
  };

  passthru.update = update-package.gomod2nix {
    inherit src;
    path = "go/" + builtins.baseNameOf ./.;
  };
}
