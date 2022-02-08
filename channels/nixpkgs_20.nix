{ self
, inputs
, ...
}:
{
  input = inputs.nixpkgs_20;
  overlaysBuilder = channels: [
    (
      final: prev: {
        broker38 = prev.callPackage ./packages/pkgs/broker { };
        broker-json = prev.callPackage ./packages/python-pkgs/broker-json { };
        eZeeKonfigurator-release = prev.callPackage ./packages/python-pkgs/eZeeKonfigurator { };
        eZeeKonfigurator-client = prev.callPackage ./packages/python-pkgs/eZeeKonfigurator-client { };
      }
    )
  ];
}
