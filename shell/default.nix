{ pkgs, inputs, self, ... }:
with pkgs;
let
  reboudBud = inputs.bud self;
in
devshell.mkShell {
  name = "Hardenedlinux-devShell";
  imports = [
    (devshell.importTOML ../devshell.toml)
    (devshell.importTOML ../packages/updates.toml)
  ];
  # tempfix: remove when merged https://github.com/numtide/devshell/pull/123
  devshell.startup.load_profiles = pkgs.lib.mkForce (pkgs.lib.noDepEntry ''
    # PATH is devshell's exorbitant privilige:
    # fence against its pollution
    _PATH=''${PATH}
    # Load installed profiles
    for file in "$DEVSHELL_DIR/etc/profile.d/"*.sh; do
      # If that folder doesn't exist, bash loves to return the whole glob
      [[ -f "$file" ]] && source "$file"
    done
    # Exert exorbitant privilige and leave no trace
    export PATH=''${_PATH}
    unset _PATH
  '');

  commands = [
    {
      category = "general commands";
      package = reboudBud {
        inherit pkgs inputs;
        name = "nixpkgs-hardenedlinux";
        description = "nixpkgs-hardenedlinux customizable system ctl";
        budStdProfile = false;
      };
    }
    {
      name = nixpkgs-fmt.pname;
      help = nixpkgs-fmt.meta.description;
      package = nixpkgs-fmt;
    }
    {
      name = nvfetcher-bin.pname;
      help = nvfetcher-bin.meta.description;
      command = "export NIX_PATH=nixpkgs=${pkgs.path}; cd $PRJ_ROOT/packages; ${nvfetcher-bin}/bin/nvfetcher -c ./sources.toml $@";
    }
  ];
}
