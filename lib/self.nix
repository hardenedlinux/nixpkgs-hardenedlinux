{lib}: let
  inherit (builtins) attrNames isAttrs readDir listToAttrs;
  inherit (lib) removeSuffix;
in rec {
  # pathsToNixScript = path: pkgs: f: s: builtins.listToAttrs
  #   (map
  #     (scriptName: {
  #       value = inputs.utils.lib.mkApp {
  #         drv = pkgs.writeShellScriptBin scriptName ''
  #            export PATH=${lib.makeBinPath [ pkgs.nix-script-bash pkgs.nix-script
  #                                            pkgs.nix-script-haskell
  #                                          ]}
  #           ${path + "/${scriptName}"}
  #         '';
  #       };
  #       name = lib.removeSuffix ("." + s) scriptName;
  #     })
  #     (builtins.attrNames f));
}
