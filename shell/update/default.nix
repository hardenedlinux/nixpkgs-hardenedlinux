{ pkgs, lib, budUtils, inputs, ... }: {
  bud.cmds = with pkgs; {
    gomod2nix = {
      writer = budUtils.writeBashWithPaths [
        git
        gomod2nix
        coreutils
      ];
      synopsis = "gomod2nix";
      help = "linting check for your nix code";
      extraScript = ''
        export zed_url="${pkgs.zed.meta.homepage}"
        export gonfsd_url="${pkgs.go-nfsd.meta.homepage}"
      '';
      script = ./gomod2nix.bash;
    };
  };
}
