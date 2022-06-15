{
  description = "Hardenedlinux Nixpkgs Collection -> Nix Flakes ";
  nixConfig = {
    flake-registry = "https://github.com/hardenedlinux/flake-registry/raw/main/flake-registry.json";
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs_21.url = "github:NixOS/nixpkgs/release-21.11";

    flake-compat.url = "github:edolstra/flake-compat";
    flake-compat.flake = false;

    devshell.url = "github:numtide/devshell";
    devshell.inputs.nixpkgs.follows = "nixpkgs";

    pypi-deps-db.url = "github:DavHau/pypi-deps-db";
    pypi-deps-db.flake = false;
    mach-nix.url = "github:DavHau/mach-nix";
    mach-nix.inputs.pypi-deps-db.follows = "pypi-deps-db";

    poetry2nix.url = "github:nix-community/poetry2nix";
    poetry2nix.inputs.nixpkgs.follows = "nixpkgs";

    org-roam-book-template.url = "github:gtrunsec/org-roam-book-template";
    org-roam-book-template.inputs.nixpkgs.follows = "nixpkgs";

    gomod2nix.url = "github:tweag/gomod2nix";
    gomod2nix.inputs.nixpkgs.follows = "nixpkgs";

    dream2nix.url = "github:nix-community/dream2nix";
    dream2nix.inputs.nixpkgs.follows = "nixpkgs";

    xnlib.url = "github:gtrunsec/xnlib";
    xnlib.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = {
    self,
    nixpkgs,
    latest,
    utils,
    nixpkgs_20,
    ...
  } @ inputs: let
    inherit (utils.lib) exportOverlays exportPackages exportModules;
  in
    utils.lib.mkFlake {
      inherit self inputs;

      lib = import ./lib {lib = inputs.xnlib.lib;};

      # supportedSystems = [ "x86_64-linux" ];

      channelsConfig = {
        allowUnsupportedSystem = true;
        allowBroken = true;
        allowUnfree = true;
      };

      channels = import ./channels {inherit self inputs;};

      sharedOverlays =
        [
          inputs.gomod2nix.overlays.default
          inputs.devshell.overlay
          inputs.poetry2nix.overlay
          (import ./overlays/shared {inherit inputs;})
        ]
        ++ (inputs.xnlib.lib.importers.importOverlays ./overlays/shared);
      # exportOverlays automatically for all packages defined in overlaysBuilder of each channel

      overlays = exportOverlays {inherit (self) pkgs inputs;};

      outputsBuilder = channels: {
        # apps = import ./apps inputs channels;
        packages = exportPackages self.overlays channels;
        devShell = import ./devshell {inherit self inputs channels;};
      };
    }
    // {
      nixosModules = {
        honeygrove = import ./modules/honeygrove.nix;
        osquery-bin = {
          imports = [./modules/osquery.nix];
          nixpkgs.config.packageOverrides = pkgs: {} // self.packages."${pkgs.stdenv.hostPlatform.system}";
        };
      };
    };
}
