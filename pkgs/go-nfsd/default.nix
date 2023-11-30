{
  buildGoApplication,
  nixpkgs-hardenedlinux-sources,
  update-scripts,
}:
buildGoApplication rec {
  inherit (nixpkgs-hardenedlinux-sources.go-nfsd) pname src version;
  modules = ./gomod2nix.toml;
  subPackages = [ "cmd/*" ];
  # https://discourse.nixos.org/t/patchelf-called-with-dontpatchelf-flag-set/4140/4
  # Otherwise the best solution would be to add a --silent flag to ignore the error in patchelf and use that in auditTmpdir.
  noAuditTmpdir = true;

  passthru.update = update-scripts.gomod2nix {
    inherit src;
    path = builtins.baseNameOf ./.;
  };
  meta = {
    description = "Fast NFS server implemented using GoJournal";
    homepage = "https://github.com/mit-pdos/go-nfsd";
  };
}
