{
  inputs = {
    nixpkgs.follows = "std-ext/nixpkgs";

    org-roam-book-template.follows = "std-ext/org-roam-book-template";
    std-ext.url = "github:GTrunSec/std-ext";
    std-data-collection.follows = "std-ext/std-data-collection";
    std.follows = "std-ext/std";
    flops.follows = "std-ext/flops";
  };

  outputs = {std, ...} @ inputs:
    std.growOn
    {
      inherit inputs;
      cellsFrom = ./nix;

      cellBlocks = with std.blockTypes; [
        (installables "packages")

        (functions "devshellProfiles")
        (devshells "devshells")

        (runnables "entrypoints")

        (functions "lib")

        (functions "packages")

        (functions "overlays")

        (functions "nixosModules")

        (nixago "nixago")
      ];
    }
    {
      devShells = inputs.std.harvest inputs.self ["automation" "devshells"];
      overlays =
        (inputs.std.harvest inputs.self [
          ["python" "overlays"]
          ["pkgs" "overlays"]
        ])
        .x86_64-linux;
      nixosModules =
        (inputs.std.harvest inputs.self [
          ["pkgs" "nixosModules"]
        ])
        .x86_64-linux;
      packages = inputs.std.harvest inputs.self [
        ["python" "packages"]
        ["pkgs" "packages"]
      ];
    };
}
