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
          nvfetcher-update nix/pkgs/packages/sources.toml
        '';
      }
    ];
  };
}
