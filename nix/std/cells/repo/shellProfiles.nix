{ inputs, cell }:
{
  default = {
    commands = [
      {
        name = "nvfetcher-python";
        command = ''
          nix run github:GTrunSec/omnibus#scripts.nvfetcher-update \
          --refresh \
          -- nix/nvfetcher/python.toml -o nix/nvfetcher/python
        '';
      }
      {
        name = "nvfetcher-pkgs";
        command = ''
          nix run github:GTrunSec/omnibus#scripts.nvfetcher-update \
          --refresh \
          -- nix/nvfetcher/pkgs.toml -o nix/nvfetcher/pkgs
        '';
      }
      {
        name = "nvfetcher-go";
        command = ''
          nix run github:GTrunSec/omnibus#scripts.nvfetcher-update \
          --refresh \
          -- nix/nvfetcher/go.toml -o nix/nvfetcher/go
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
