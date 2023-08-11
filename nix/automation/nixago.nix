{ inputs, cell }:
let
  inherit (inputs) std-ext;
in
{
  # mdbook = std.presets.nixago.mdbook {
  #   configData = {
  #     book.title = "nixpkgs hardenedlinux";
  #   };
  # };

  treefmt =
    std-ext.preset.nixago.treefmt
      {
        data.formatter.prettier = {
          excludes = [
            "generated.json"
            "gomod2nix.toml"
          ];
        };
      }
      std-ext.preset.configs.treefmt.nvfetcher;
}
