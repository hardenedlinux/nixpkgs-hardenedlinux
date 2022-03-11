{lib}: let
  inherit (builtins) attrNames isAttrs readDir listToAttrs;
  inherit (lib) removeSuffix;
  genAttrs' = values: f: listToAttrs (map f values);
  pathsToImportedAttrs = paths:
    genAttrs' paths (
      path: {
        name = removeSuffix ".nix" (baseNameOf path);
        value = import path;
      }
    );

  filterFiles = path: name: let
    a = key: value:
      value
      == "regular"
      && lib.hasSuffix ".${name}" key
      && key != "default.nix";
  in
    lib.filterAttrs a (builtins.readDir path);

  overlayPaths = dir: let
    fullPath = name: dir + "/${name}";
  in
    map fullPath (attrNames (filterFiles dir "nix"));
in rec {
  inherit genAttrs' pathsToImportedAttrs filterFiles;
  importOverlays = dir: lib.attrValues (pathsToImportedAttrs (overlayPaths dir));
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
