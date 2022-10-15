{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-lock.follows = "nixpkgs";

    cells-lab.url = "github:GTrunSec/cells-lab";
    std.follows = "cells-lab/std";
  };

  inputs = {
    nixos.url = "github:NixOS/nixpkgs/nixos-22.05";
  };

  outputs = {std, ...} @ inputs:
    std.growOn {
      inherit inputs;
      cellsFrom = ./nix;

      cellBlocks = [
        (std.blockTypes.installables "packages")

        (std.blockTypes.functions "devshellProfiles")
        (std.blockTypes.devshells "devshells")

        (std.blockTypes.runnables "entrypoints")

        (std.blockTypes.functions "lib")

        (std.blockTypes.functions "packages")

        (std.blockTypes.functions "overlays")

        (std.blockTypes.functions "nixosModules")

        (std.blockTypes.nixago "nixago")
      ];
    } {
      devShells = inputs.std.harvest inputs.self ["_main" "devshells"];
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
