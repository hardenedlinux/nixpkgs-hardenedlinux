{
  self,
  inputs,
}: {
  input = inputs.nixpkgs_21;
  overlaysBuilder = channels: [
    (
      final: prev: rec {
        zeekscript = prev.python3Packages.callPackage ../pkgs/python/zeekscript {inherit py-tree-sitter;};
        py-tree-sitter = prev.python3Packages.callPackage ../pkgs/python/py-tree-sitter {};
      }
    )
  ];
}
