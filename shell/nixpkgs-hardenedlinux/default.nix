{ pkgs, lib, budUtils, ... }: {
  bud.cmds = with pkgs; {
    nix-lint = {
      writer = budUtils.runner [
        statix
        findutils
      ];
      synopsis = "nix-lint |(check|fix)";
      help = "linting check for your nix code";
      script = ./nix-lint.bash;
    };
  };
}
