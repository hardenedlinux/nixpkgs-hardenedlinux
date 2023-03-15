{
  stdenv,
  lib,
  nixpkgs-hardenedlinux-pkgs-sources,
  bundlerEnv,
  ruby,
  mkPnpmPackage,
  runCommand,
  nodejs-16_x,
  buildNpmPackage,
}: let
  inherit (nixpkgs-hardenedlinux-pkgs-sources.openproject) pname version src;
  src' = runCommand "frontend" {} ''
    cp -RL --no-preserve=mode ${src}/frontend $out
    cp ${./pnpm-lock.yaml} $out/pnpm-lock.yaml
  '';
  # frontend = buildNpmPackage {
  #   name = pname + "-frontend";
  #   src = src';
  #   nodejs = nodejs-16_x;
  #   # installPhase = "cp -r build $out/";
  #   # extraNodeModulesArgs.buildInputs = [];
  #   # extraEnvVars = {
  #   #   NODE_OPTIONS = "--openssl-legacy-provider";
  #   # };
  #   npmBuild = ''
  #     npm run build --offline
  #   '';
  # };
  frontend = mkPnpmPackage {
    inherit version;
    name = pname + "-frontend";
    src = src';
    nodejs = nodejs-16_x;
  };
  # TODO: backend
in
  # bundlerEnv {
  #   name = "openproject-dev";
  #   inherit ruby;
  #   gemdir = src;
  #   gemfile = src + "/Gemfile";
  #   lockfile = src + "/Gemfile.lock";
  #   gemset = src + "/nix/gemset.nix";
  # }
  frontend
