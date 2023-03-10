{
  inputs,
  cell,
}: {
  default = {
    commands = [
      {
        name = "nvfetcher-python";
        command = ''
          nix develop github:GTrunSec/std-ext#update \
          --refresh --command \
          nvfetcher-update nix/python/packages/sources.toml
        '';
      }
    ];
  };
}
