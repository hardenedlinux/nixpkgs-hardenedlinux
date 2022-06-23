{
  self,
  inputs,
}: {
  input = inputs.nixpkgs_21;
  overlaysBuilder = channels: [
    (
      final: prev: rec {
        zeekscript = prev.python39Packages.callPackage ../pkgs/python/zeekscript {inherit py-tree-sitter;};
        py-tree-sitter = prev.python39Packages.callPackage ../pkgs/python/py-tree-sitter {};
      }
    )
  ];
}
