{
  self,
  inputs,
  ...
}: {
  input = inputs.nixpkgs_20;
  overlaysBuilder = channels: [
    (
      final: prev: rec {
        broker38 = prev.callPackage ../pkgs/top-level/broker {};
        broker-json = prev.callPackage ../pkgs/python/broker-json {};
        eZeeKonfigurator-release = prev.callPackage ../pkgs/python/eZeeKonfigurator {};
        eZeeKonfigurator-client = prev.callPackage ../pkgs/python/eZeeKonfigurator-client {};
      }
    )
  ];
}
