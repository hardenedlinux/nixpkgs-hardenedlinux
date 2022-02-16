{
  description = "Hardenedlinux Nixpkgs Collection -> Nix Flakes ";
  nixConfig = {
    flake-registry = "https://github.com/hardenedlinux/flake-registry/raw/main/flake-registry.json";
    #flake-registry = "/home/gtrun/ghq/github.com/hardenedlinux/flake-registry/flake-registry.json";
  };
  inputs = {
    flake-compat.flake = false;
    pypi-deps-db = {
      url =  "github:DavHau/pypi-deps-db";
      flake = false;
    };
    mach-nix = { inputs.pypi-deps-db.follows = "pypi-deps-db";};
    check_journal = { url = "github:flyingcircusio/check_journal"; };
  };
  outputs =
    {
      self,
      nixpkgs,
      utils,
      devshell,
      pypi-deps-db,
      latest,
      nixpkgs_20,
      gomod2nix,
      mach-nix,
      ...
    }
    @ inputs:
    let
      inherit (utils.lib) exportOverlays exportPackages exportModules;
    in
      utils.lib.mkFlake {
        inherit self inputs;

        lib = import ./lib/self.nix { lib = nixpkgs.lib; };

        # supportedSystems = [ "x86_64-linux" ];
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
          ]
          ++ (self.lib.importOverlays ./overlays/share);
        # exportOverlays automatically for all packages defined in overlaysBuilder of each channel
        overlays = exportOverlays { inherit (self) pkgs inputs; };
        outputsBuilder = channels: {
          # apps = import ./apps inputs channels;
          packages = exportPackages self.overlays channels;
          #devShell = import ./shell { inherit self inputs channels; };
        };
      }
      // {
        nixosModules = {
          honeygrove = import ./modules/honeygrove.nix;
          osquery-bin = {
            imports = [ ./modules/osquery.nix ];
            nixpkgs.config.packageOverrides = pkgs: {
              inherit
                (self.packages."${pkgs.stdenv.hostPlatform.system}")
                osquery-bin
                ;
            };
          };
        };
      };
}
