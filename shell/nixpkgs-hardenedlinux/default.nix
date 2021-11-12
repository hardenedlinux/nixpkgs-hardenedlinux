{ pkgs, lib, budUtils, inputs, ... }: {
  bud.cmds = with pkgs; {
    nix-lint = {
      writer = budUtils.writeBashWithPaths [
        inputs.statix.defaultPackage."${system}"
        findutils
      ];
      synopsis = "nix-lint |(check|fix)";
      help = "linting check for your nix code";
      script = ./nix-lint.bash;
    };
    gh-nix-update = {
      writer = budUtils.writeBashWithPaths [ gnused findutils ];
      synopsis = "gh-nix-update";
      help = "update your nix verison of Github Action";
      extraScript = ''
        export nix_version=${toString nixpkgs-hardenedlinux-sources.nix-unstable-installer.src.urls}
      '';
      script = ./gh-nix-update.bash;
    };
  };
}
