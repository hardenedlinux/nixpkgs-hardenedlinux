{
  stdenv,
  lib,
  nixpkgs-hardenedlinux-pkgs-sources,
  bundlerEnv,
  ruby,
}: let
  inherit (nixpkgs-hardenedlinux-pkgs-sources.openproject) pname version src;
  # TODO: frontend
  # TODO: backend
in
  bundlerEnv {
    name = "openproject-dev";
    inherit ruby;
    gemdir = src;
    gemfile = src + "/Gemfile";
    lockfile = src + "/Gemfile.lock";
    gemset = src + "/nix/gemset.nix";
  }
