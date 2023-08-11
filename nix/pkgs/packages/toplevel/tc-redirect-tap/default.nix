{
  buildGoApplication,
  nixpkgs-hardenedlinux-sources,
  update-scripts,
}:
buildGoApplication rec {
  inherit (nixpkgs-hardenedlinux-sources.tc-redirect-tap) pname src version;
  modules = ./gomod2nix.toml;
  subPackages = [ "cmd/tc-redirect-tap" ];
  passthru.update = update-scripts.gomod2nix {
    inherit src;
    path = builtins.baseNameOf ./.;
  };
  meta = {
    description = "tc-redirect-tap is a CNI plugin. This plugin allows you to adapt pre-existing CNI plugins/configuration to a tap device.";
    homepage = "https://github.com/awslabs/tc-redirect-tap";
  };
}
