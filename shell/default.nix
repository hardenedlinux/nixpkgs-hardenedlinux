{ inputs, pkgs, ... }:
{
  modules = with inputs; [
    bud.devshellModules.bud
  ];
  exportedModules = [
    (pkgs.devshell.importTOML ../devshell.toml)
  ];
}
