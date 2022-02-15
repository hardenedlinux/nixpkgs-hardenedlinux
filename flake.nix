{
  description = "Hardenedlinux Nixpkgs Collection -> Nix Flakes ";
  nixConfig = {
    flake-registry = "https://github.com/hardenedlinux/flake-registry/raw/main/flake-registry.json";
    #flake-registry = "/home/gtrun/ghq/github.com/hardenedlinux/flake-registry/flake-registry.json";
  };
  inputs = {
    flake-compat.flake = false;
    mach-nix = { inputs.pypi-deps-db.follows = "pypi-deps-db"; };
    pypi-deps-db = { flake = false; };
    # packages inputs
    check_journal = { url = "github:GTrunSec/check_journal/flake"; };
    bud = { url = "github:GTrunSec/bud/extend"; };
  };
  outputs =
    { self
    , nixpkgs
    , utils
    , devshell
    , latest
    , nixpkgs_20
    , nvfetcher
    , gomod2nix
    , mach-nix
    , pypi-deps-db
    , microvm
    , ...
    }
    @ inputs:
    let
      inherit (utils.lib) exportOverlays exportPackages exportModules;
    in
      utils.lib.mkFlake {
        inherit self inputs;

        lib = import ./lib/self.nix { lib = nixpkgs.lib; };

        supportedSystems = [ "x86_64-linux" ];
        channelsConfig = {
          allowUnsupportedSystem = true;
          allowBroken = true;
          allowUnfree = true;
        };

        channels = import ./channels { inherit self inputs; };

        sharedOverlays =
          [
            gomod2nix.overlay
            (import ./overlays/share { inherit inputs; })
          ] ++ (self.lib.importOverlays ./overlays/share);
        # exportOverlays automatically for all packages defined in overlaysBuilder of each channel
        overlays = exportOverlays { inherit (self) pkgs inputs; };
        outputsBuilder = channels: {
          # apps = import ./apps inputs channels;
          packages = exportPackages self.overlays channels;
          devShell = import ./shell/devshell.nix { inherit self inputs channels; };
        };
      }
      // {
        budModules = {
          nixpkgs-hardenedlinux = {
            category = "general commands";
            description = "highly customizable system ctl for nixpkgs-hardenedlinux";
            path = import ./shell/nixpkgs-hardenedlinux;
          };
          update = {
            category = "update";
            description = "Updating the packages of nested commands";
            path = import ./shell/update;
          };
        };
        nixosModules = {
          honeygrove = import ./modules/honeygrove.nix;
          osquery-bin = {
            imports = [
              {
                nixpkgs.config.packageOverrides = pkgs: {
                  inherit
                    (self.packages."${pkgs.stdenv.hostPlatform.system}")
                    osquery-bin
                    ;
                };
              }
              ./modules/osquery.nix
            ];
          };
        };
      };
}
