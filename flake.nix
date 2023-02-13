{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    org-roam-book-template.follows = "cells-lab/org-roam-book-template";
    cells-lab.url = "github:GTrunSec/cells-lab";
    std-data-collection.follows = "cells-lab/std-data-collection";
    std.follows = "cells-lab/std";
  };

  inputs = {
    nixos.follows = "cells-lab/nixos";
  };

  outputs = {std, ...} @ inputs:
    std.growOn {
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
    } {
      devShells = inputs.std.harvest inputs.self ["automation" "devshells"];
      overlays = builtins.getAttr "x86_64-linux" (inputs.std.harvest inputs.self [
        ["python" "overlays"]
        ["go" "overlays"]
        ["pkgs" "overlays"]
      ]);
      nixosModules = builtins.getAttr "x86_64-linux" (inputs.std.harvest inputs.self [
        ["pkgs" "nixosModules"]
      ]);
      packages = inputs.std.harvest inputs.self [
        ["python" "packages"]
        ["go" "packages"]
        ["pkgs" "packages"]
      ];
    };
}
