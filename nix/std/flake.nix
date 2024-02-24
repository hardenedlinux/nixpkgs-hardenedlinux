{
  inputs = { };

  outputs =
    { ... }@inputs:
    let
      inputsSource = inputs // rec {
        nixpkgs = (import ../..).inputs.nixpkgs;
        omnibus = import (import ../..).inputs.omnibusSrc;
        inherit (omnibus.flake.inputs) std;
      };
      inherit (inputsSource.omnibus.flake.inputs) std;
    in
    std.growOn
      {
        inputs = inputsSource;

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
        devShells = std.harvest inputs.self [
          "repo"
          "shells"
        ];
        overlays =
          (std.harvest inputs.self [
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
          (std.harvest inputs.self [
            [
              "pkgs"
              "nixosModules"
            ]
          ]).x86_64-linux;
        packages = std.harvest inputs.self [
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
