{ inputs, pkgs }:
let
  l = inputs.nixpkgs.lib // builtins;
in
{
  toplevel =
    (inputs.flops.lib.configs.haumea.setInit {
      src = ./toplevel;
      loader = _: path: pkgs.callPackage path { };
      transformer = [
        (
          _cursor: dir:
          if dir ? default then assert (l.hasAttr "default" dir); dir.default else dir
        )
      ];
    }).outputsForTarget
      "default";

  python =
    selfP: p:
    (inputs.flops.lib.configs.haumea.setInit {
      src = ./python;
      loader = _: path: selfP.callPackage path { };
      transformer = [
        (
          _cursor: dir:
          if dir ? default then assert (l.hasAttr "default" dir); dir.default else dir
        )
      ];
    }).outputsForTarget
      "default";
}
