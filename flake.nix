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
    bud = {
      url = "github:GTrunSec/bud/extend";
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
    , nixpkgs_20
    , nvfetcher
    , gomod2nix
    , mach-nix
    , pypi-deps-db
    , microvm
    , ...
    }@inputs:
    let
      inherit (utils.lib) exportOverlays exportPackages exportModules;
      inherit (nixpkgs) lib;
      selfLib = import ./lib/self.nix { inherit lib inputs; };
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
                (final: prev: {
                  inherit (channels.latest)
                    ;
                })
              ];
          };
          nixpkgs_20 = {
            input = nixpkgs_20;
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
        ] ++ (selfLib.importOverlays ./overlays);

        # exportOverlays automatically for all packages defined in overlaysBuilder of each channel
        overlays = exportOverlays {
          inherit (self) pkgs inputs;
        };

        outputsBuilder = channels: {
          # apps = import ./apps inputs channels;
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
          devShell =
            let
              eval = import "${devshell}/modules" channels.nixpkgs;
              configuration = {
                name = channels.nixpkgs.lib.mkDefault "devshell";
                imports =
                  let
                    devshell = import ./shell {
                      inherit inputs;
                      pkgs = channels.nixpkgs;
                    };
                  in
                  devshell.modules ++ devshell.exportedModules;
              };
            in
            (eval {
              inherit configuration;
              extraSpecialArgs = { inherit self inputs; };
            }).shell;
        };
      } // {
      overlay = final: prev:
        (selfLib.pathsToCallPkgs ./packages/python-pkgs prev) //
        (selfLib.pathsToPythonCallPkgs ./packages/pkgs prev) //
        {
          nixpkgs-hardenedlinux-sources = prev.callPackage ./packages/_sources/generated.nix { };
          osquery-vm-tests = prev.lib.optionalAttrs prev.stdenv.isLinux (import ./tests/osquery {
            makeTest = import (prev.path + "/nixos/tests/make-test-python.nix");
            pkgs = final;
            inherit self;
          });
        } // import ./packages/inputs-packages.nix inputs prev final;
    } //
    {
      budModules = {
        nixpkgs-hardenedlinux = {
          category = "general commands";
          description = "highly customizable system ctl for nixpkgs-hardenedlinux";
          path = import ./shell/nixpkgs-hardenedlinux;
        };
        update = { category = "update"; description = "Updating the packages of nested commands"; path = import ./shell/update; };
      };
      nixosModules = {
        honeygrove = import ./modules/honeygrove.nix;
        osquery-bin = {
          imports = [
            {
              nixpkgs.config.packageOverrides = pkgs: {
                inherit (self.packages."${pkgs.stdenv.hostPlatform.system}") osquery-bin;
              };
            }
            ./modules/osquery.nix
          ];
        };
      };
    };
}
