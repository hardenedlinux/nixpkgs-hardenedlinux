{
  lib,
  fetchFromGitHub,
  python3Packages,
  nixpkgs-hardenedlinux-sources,
  mach-nix,
  makeWrapper,
  mkShell,
  pyqt5,
  twisted,
}:
let
  vailyn-requirements = mach-nix.mkPython rec {
    providers = { PyQt5 = "nixpkgs"; };
    requirements = ''
      treelib
      requests
      argparse
      colorama

      # GUI requirements
      # PyQt5

      # Crawler Requirements
      scrapy
      PyDispatcher
      terminaltables
      # twisted
      arjun

      # RCE Requirements
      psutil

      # Other
      setproctitle
      notify2
    '';
  };
in
mkShell {
  name = "vailyn-shell";
  buildInputs = [ vailyn-requirements pyqt5 twisted ];
}
