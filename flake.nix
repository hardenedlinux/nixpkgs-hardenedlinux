{
  description = "Hardenedlinux Nixpkgs Collection -> Nix Flakes ";

  nixConfig = {
    flake-registry = "https://github.com/hardenedlinux/flake-registry/raw/main/flake-registry.json";
  };

  inputs = {
    stable.url = "github:nixos/nixpkgs/release-20.09";
    flake-compat.flake = false;
    gomod2nix = { url = "github:tweag/gomod2nix"; inputs.nixpkgs.follows = "nixpkgs"; };
    mach-nix = { inputs.pypi-deps-db.follows = "pypi-deps-db"; };
    pypi-deps-db = {
      url = "github:DavHau/pypi-deps-db";
      flake = false;
    };
    # packages inputs
    check_journal = { url = "github:GTrunSec/check_journal/flake"; };
    nix_script = { url = "github:BrianHicks/nix-script"; };
    bud = {
      url = "github:GTrunSec/bud/custom";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.devshell.follows = "devshell";
    };
  };

  outputs =
    { self
    , nixpkgs
    , utils
    , devshell
    , latest
    , statix
    , stable
    , nvfetcher
    , nix_script
    , gomod2nix
    , mach-nix
    , pypi-deps-db
    , microvm
    , ...
    }@inputs:
    let
      inherit (utils.lib) exportOverlays exportPackages exportModules;
      inherit (nixpkgs) lib;
      inherit (builtins) attrValues;
      inherit (utilsLib) pathsToImportedAttrs overlayPaths;
      utilsLib = import ./lib/utils-extend.nix { inherit lib inputs; };
    in
    utils.lib.mkFlake
      {
        inherit self inputs;
        # supportedSystems = [ "x86_64-linux" ];

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
                nvfetcher.overlay
                nix_script.overlay
                (final: prev: {
                  inherit (channels.latest)
                    ;
                })
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
          latest = {
            input = latest;
            overlaysBuilder = channels: [
              statix.overlay
            ];
          };
        };

        sharedOverlays = [
          gomod2nix.overlay
          devshell.overlay
          (final: prev:
            {
              __dontExport = true;
              #Python overlay
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
          apps = import ./apps inputs channels;
          # construct exportPackages to export all packages defined in overlays
          packages = exportPackages self.overlays channels // {
            osquery-microvm = microvm.lib.runner
              {
                system = "x86_64-linux";
                hypervisor = "qemu";
                nixosConfig = { pkgs, ... }: {
                  networking.hostName = "osquery-microvm";
                  users.users.root.password = "";
                  imports = [
                    self.nixosModules.osquery-bin
                    ./tests/osquery/service.nix
                  ];
                  users.defaultUserShell = pkgs.zsh;
                  programs.zsh = {
                    enable = true;
                    enableCompletion = true;
                    autosuggestions.enable = true;
                    syntaxHighlighting = {
                      enable = true;
                    };
                  };
                };
                volumes = [{
                  mountpoint = "/var";
                  image = "/tmp/osquery-microvm.img";
                  size = 256;
                }];
                socket = "control.socket";
              };
          };
          devShell = import ./shell {
            pkgs = channels.nixpkgs;
            inherit inputs self;
          };
        };
      } // {
      overlay = final: prev:
        (utilsLib.pathsToCallPkgs ./packages/python-pkgs prev) //
        (utilsLib.pathsToCallPkgs ./packages/pkgs prev) // {
          # lib
          lib = prev.lib.extend
            (lfinal: lprev: {
              utils-extend = import ./lib/utils-extend.nix { inherit lib inputs; };
            });
          nixpkgs-hardenedlinux-sources = prev.callPackage ./packages/_sources/generated.nix { };
        } // import ./packages/inputs-packages.nix inputs final prev;
    } //
    {
      budModules = {
        nixpkgs-hardenedlinux = import ./shell/nixpkgs-hardenedlinux;
        update = import ./shell/update;
      };
      nixosModules = {
        honeygrove = import ./modules/honeygrove.nix;
        osquery-bin = {
          imports = [
            {
              nixpkgs.config.packageOverrides = pkgs: {
                inherit (self.packages."${pkgs.system}") osquery-bin;
              };
            }
            ./modules/osquery.nix
          ];
        };
      };
    };
}
