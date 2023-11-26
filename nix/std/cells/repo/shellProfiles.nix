{ inputs, cell }:
{
  default = {
    commands = [
      {
        name = "nvfetcher-python";
        command = ''
          nix run github:GTrunSec/omnibus#scripts.nvfetcher-update \
          --refresh \
          -- nix/_sources/python.toml -o nix/_sources/python
        '';
      }
      {
        name = "nvfetcher-pkgs";
        command = ''
          nix run github:GTrunSec/omnibus#scripts.nvfetcher-update \
          --refresh \
          -- nix/_sources/pkgs.toml -o nix/_sources/pkgs
        '';
      }
      {
        name = "nvfetcher-go";
        command = ''
          nix run github:GTrunSec/omnibus#scripts.nvfetcher-update \
          --refresh \
          -- nix/_sources/go.toml -o nix/_sources/go
        '';
      }
      {
        name = "nvfetcher-all";
        command = ''
        nvfetcher-python; nvfetcher-pkgs; nvfetcher-go
        '';
      }
    ];
  };
}
