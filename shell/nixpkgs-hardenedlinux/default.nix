{ pkgs, lib, budUtils, ... }: {
  bud.cmds = with pkgs; {
    check = {
      writer = budUtils.writeBashWithPaths [
        findutils
      ];
      synopsis = "check |(check)";
      help = "check";
      script = ./check.bash;
    };
  };
}
