{
  buildGoApplication,
  nixpkgs-hardenedlinux-sources,
  update-scripts,
}:
buildGoApplication rec {
  inherit (nixpkgs-hardenedlinux-sources.firecracker-task-driver)
    pname
    src
    version
    ;
  modules = ./gomod2nix.toml;
  meta = {
    description = "nomad task driver that uses firecracker to start micro-vms";
    homepage = "https://github.com/cneira/firecracker-task-driver";
  };
  passthru.update = update-scripts.gomod2nix {
    inherit src;
    path = builtins.baseNameOf ./.;
  };
}
