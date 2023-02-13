{
  inputs,
  cell,
}: let
  inherit (inputs) std-data-collection;
in {
  # mdbook = std.presets.nixago.mdbook {
  #   configData = {
  #     book.title = "nixpkgs hardenedlinux";
  #   };
  # };

  treefmt = std-data-collection.data.configs.treefmt {
    data.formatter.nix = {
      excludes = [
        "generated.nix"
      ];
    };
    data.formatter.prettier = {
      excludes = [
        "generated.json"
        "gomod2nix.toml"
      ];
    };
  };
}
