{
  self,
  inputs,
  ...
}: {
  input = inputs.nixpkgs_20;
  overlaysBuilder = channels: [
    (
      final: prev: rec {
        broker38 = prev.callPackage ../packages/default/broker {};
        broker-json = prev.callPackage ../packages/python/broker-json {};
        eZeeKonfigurator-release = prev.callPackage ../packages/python/eZeeKonfigurator {};
        eZeeKonfigurator-client = prev.callPackage ../packages/python/eZeeKonfigurator-client {};
      }
    )
  ];
}
