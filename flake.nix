{
  description = "Hardenedlinux Nixpkgs Collection -> Nix Flakes ";

  inputs = {
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";
    nixpkgs.url = "nixpkgs/release-21.05";
    stable.url = "nixpkgs/release-20.09";
    nvfetcher = { url = "github:berberman/nvfetcher"; };
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };
    devshell = { url = "github:numtide/devshell"; };
    gomod2nix = { url = "github:tweag/gomod2nix"; inputs.nixpkgs.follows = "nixpkgs"; };
    mach-nix = { url = "github:DavHau/mach-nix"; inputs.pypi-deps-db.follows = "pypi-deps-db"; };
    pypi-deps-db = {
      url = "github:DavHau/pypi-deps-db";
      flake = false;
    };
  };


  outputs = inputs: with builtins; with inputs;
    let
      inherit (utils.lib) exportOverlays exportPackages exportModules;
      inherit (nixpkgs) lib;
      inherit (builtins) attrValues;
      inherit (utils-lib) pathsToImportedAttrs overlayPaths;
      utils-lib = import ./lib/utils-ext.nix { inherit lib; };
    in
    utils.lib.mkFlake
      {
        inherit self inputs;

        supportedSystems = [ "x86_64-linux" ];

        channelsConfig = {
          allowUnsupportedSystem = true;
          allowBroken = true;
          allowUnfree = true;
        };

        channels = {
          nixpkgs = {
            input = nixpkgs;
            overlaysBuilder = channels:
              [
                self.overlay
                (final: prev: { nvfetcher-bin = nvfetcher.defaultPackage."${final.system}"; })
              ];
          };
          stable = {
            input = stable;
            overlaysBuilder = channels: [
              (final: prev: {
                broker = prev.callPackage ./packages/pkgs/broker { };
                broker-json = prev.callPackage ./packages/python-pkgs/broker-json { };
                eZeeKonfigurator-release = prev.callPackage ./packages/python-pkgs/eZeeKonfigurator { };
              })
            ];
          };
        };

        sharedOverlays = [
          gomod2nix.overlay
          devshell.overlay
          (final: prev:
            {
              __dontExport = true;
              #python
              machlib = import mach-nix {
                pkgs = prev;
                pypiData = pypi-deps-db;
              };
            })
        ] ++ (attrValues (pathsToImportedAttrs overlayPaths));

        # exportOverlays automatically for all packages defined in overlaysBuilder of each channel
        overlays = exportOverlays {
          inherit (self) pkgs inputs;
        };

        outputsBuilder = channels: {
          # construct exportPackages to export all packages defined in overlays
          packages = exportPackages self.overlays channels;
          devShell = import ./shell { pkgs = channels.nixpkgs; };
        };
      } // {
      overlay = final: prev:
        let
          pythonDirNames = builtins.attrNames (builtins.readDir ./packages/python-pkgs);
          pkgsDirNames = builtins.attrNames (builtins.readDir ./packages/pkgs);
        in
        (
          builtins.listToAttrs
            (map
              (pkgDir: {
                value = prev.python3Packages.callPackage (./packages/python-pkgs + "/${pkgDir}") { };
                name = pkgDir;
              })
              pythonDirNames)
        ) //
        (
          builtins.listToAttrs
            (map
              (pkgDir: {
                value = prev.callPackage (./packages/pkgs + "/${pkgDir}") { };
                name = pkgDir;
              })
              pkgsDirNames)
        )
        // { nixpkgs-hardenedlinux-sources = prev.callPackage ./packages/_sources/generated.nix { }; };
    } //
    {
      nixosModules = {
        honeygrove = import ./modules/honeygrove.nix;
      };
    };
}
