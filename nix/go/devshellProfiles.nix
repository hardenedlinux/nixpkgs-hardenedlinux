{
  inputs,
  cell,
}: {
  default = {
    commands = [
      {
        name = "nvfetcher-go";
        command = ''
          nix develop github:GTrunSec/cells-lab#update \
          --refresh --command \
          nvfetcher-update nix/go/packages/sources.toml
        '';
      }
    ];
  };
}
