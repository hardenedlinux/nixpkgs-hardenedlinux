{
  inputs = {
    nixpkgs.follows = "omnibusStd/nixpkgs";
    omnibusStd.url = "github:gtrunsec/omnibus/?dir=local";
    std.follows = "omnibusStd/std";
  };

  outputs =
    { std, ... }@inputs:
    std.growOn
      {
        inputs = inputs // {
          omnibus = import (inputs.omnibusStd.inputs.call-flake ../..).inputs.omnibusSrc;
        };
        cellsFrom = ./cells;

        cellBlocks = with std.blockTypes; [
          (installables "packages")

          (functions "shellProfiles")
          (devshells "shells")

          (runnables "entrypoints")

          (functions "lib")

          (functions "packages")

          (functions "overlays")

          (functions "pops")

          (nixago "nixago")
        ];
      }
      {
        devShells = inputs.std.harvest inputs.self [
          "repo"
          "shells"
        ];
        overlays =
          (inputs.std.harvest inputs.self [
            [
              "python"
              "overlays"
            ]
            [
              "pkgs"
              "overlays"
            ]
          ]).x86_64-linux;
        nixosModules =
          (inputs.std.harvest inputs.self [
            [
              "pkgs"
              "nixosModules"
            ]
          ]).x86_64-linux;
        packages = inputs.std.harvest inputs.self [
          [
            "python"
            "packages"
          ]
          [
            "pkgs"
            "packages"
          ]
        ];
      };
}
