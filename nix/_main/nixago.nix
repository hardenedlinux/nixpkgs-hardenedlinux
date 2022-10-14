{
  inputs,
  cell,
}: let
  inherit (inputs) std;
in {
  mdbook = std.presets.nixago.mdbook {
    configData = {
      book.title = "Std Template";
    };
  };

  treefmt = std.presets.nixago.treefmt {
    configData.formatter.nix = {
      excludes = [
        "generated.nix"
      ];
    };
    configData.formatter.prettier = {
      excludes = [
        "generated.json"
      ];
    };
  };
}
