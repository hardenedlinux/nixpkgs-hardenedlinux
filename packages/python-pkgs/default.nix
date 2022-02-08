final: prev: {
  zat = prev.python3Packages.callPackage ./zat { };
  zqd = prev.python3Packages.callPackage ./zqd { };
  elastalert2 = prev.python3Packages.callPackage ./elastalert2 { };
  btest = prev.python3Packages.callPackage ./btest { };
}
