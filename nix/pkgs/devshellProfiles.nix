{
  inputs,
  cell,
}: {
  default = {
    commands = [
      {
        name = "nvfetcher-pkgs";
        command = ''
          nix develop github:GTrunSec/std-ext#update \
          --refresh --command \
          nvfetcher-update nix/pkgs/packages/_sources/pkgs.toml -o nix/pkgs/packages/_sources/pkgs
        '';
      }
      {
        name = "nvfetcher-go";
        command = ''
          nix develop github:GTrunSec/std-ext#update \
          --refresh --command \
          nvfetcher-update nix/pkgs/packages/_sources/go.toml -o nix/pkgs/packages/_sources/go
        '';
      }
    ];
  };
}
