{
  inputs,
  cell,
}: {
  default = final: prev: rec {
    zed-python = prev.python3Packages.callPackage ./packages/zed {};
    elastalert2 = prev.python3Packages.callPackage ./packages/elastalert2 {};
    btest = prev.python3Packages.callPackage ./packages/btest {};
    # zeekscript = prev.python3Packages.callPackage ./packages/zeekscript {inherit py-tree-sitter;};
    # py-tree-sitter = prev.python3Packages.callPackage ./packages/py-tree-sitter {};
    vault-cli = prev.python3Packages.callPackage ./packages/vault-cli {};
    aim = prev.python3Packages.callPackage ./packages/aim {};
  };
}
