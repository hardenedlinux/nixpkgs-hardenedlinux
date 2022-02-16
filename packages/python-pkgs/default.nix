final: prev: {
  zat = prev.python3Packages.callPackage ./zat { };
  python-zed = prev.python3Packages.callPackage ./zed { };
  elastalert2 = prev.python3Packages.callPackage ./elastalert2 { };
  btest = prev.python3Packages.callPackage ./btest { };
}
