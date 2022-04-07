final: prev: rec {
  zat = prev.python3Packages.callPackage ./zat {};
  python-zed = prev.python3Packages.callPackage ./zed {};
  elastalert2 = prev.python3Packages.callPackage ./elastalert2 {};
  btest = prev.python3Packages.callPackage ./btest {};
  zeekscript = prev.python3Packages.callPackage ./zeekscript {inherit py-tree-sitter;};
  py-tree-sitter = prev.python3Packages.callPackage ./py-tree-sitter {};
  vault-cli = prev.python3Packages.callPackage ./vault-cli {};
}
