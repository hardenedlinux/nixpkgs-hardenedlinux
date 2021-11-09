{ lib, inputs, ... }:
let
  inherit (builtins) attrNames isAttrs readDir listToAttrs;

  inherit (lib) removeSuffix;

  genAttrs' = values: f: listToAttrs (map f values);

  pathsToImportedAttrs = paths:
    genAttrs' paths (path: {
      name = removeSuffix ".nix" (baseNameOf path);
      value = import path;
    });
  filterBash = path:
    let a = key: value: value == "regular" && lib.hasSuffix ".bash" key && key != "default.nix"; in
    lib.filterAttrs a (builtins.readDir path);
  filterHaskell =
    let a = key: value: value == "regular" && lib.hasSuffix ".hs" key && key != "default.nix"; in
    lib.filterAttrs a (builtins.readDir ../apps);
in
rec {
  inherit genAttrs' pathsToImportedAttrs filterBash filterHaskell;

  overlayPaths =
    let
      overlayDir = ../overlays;
      fullPath = name: overlayDir + "/${name}";
    in
    map fullPath (attrNames (readDir overlayDir));

  pathsToCallPkgs = path: pkgs: builtins.listToAttrs
    (map
      (pkgName: {
        value = pkgs.python3Packages.callPackage (path + "/${pkgName}") { };
        name = pkgName;
      })

      (builtins.attrNames (builtins.readDir path)));

  pathsToNixScript = path: pkgs: f: s: builtins.listToAttrs
    (map
      (scriptName: {
        value = inputs.utils.lib.mkApp {
          drv = pkgs.writeShellScriptBin scriptName ''
             export PATH=${lib.makeBinPath [ pkgs.nix-script-bash pkgs.nix-script
                                             pkgs.nix-script-haskell
                                           ]}
            ${path + "/${scriptName}"}
          '';
        };
        name = lib.removeSuffix ("." + s) scriptName;
      })
      (builtins.attrNames f));
}
