{
  buildGoApplication,
  nixpkgs-hardenedlinux-go-sources,
  update,
}:
buildGoApplication rec {
  inherit (nixpkgs-hardenedlinux-go-sources.go-chatgpt-web) pname version src;

  modules = ./gomod2nix.toml;

  subPackages = ["."];

  passthru.update = update.gomod2nix {
    inherit src;
    path = builtins.baseNameOf ./.;
  };
  meta = {
    homepage = "https://github.com/869413421/chatgpt-web";
  };
}
