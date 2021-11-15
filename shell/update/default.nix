{ pkgs, lib, budUtils, inputs, ... }: {
  bud.cmds = with pkgs; {
    gomod2nix = {
      writer = budUtils.writeBashWithPaths [
        git
        gomod2nix
        coreutils
      ];
      synopsis = "gomod2nix";
      help = "updating gomod2nix.toml for packages";
      extraScript = ''
        export zed_url="${pkgs.zed.meta.homepage}"
        export gonfsd_url="${pkgs.go-nfsd.meta.homepage}"

        urls=("$zed_url" "$gonfs_url")
        names=("zed" "go-nfsd")
      '';
      script = ./gomod2nix.bash;
    };
  };
}
