final: prev: {
  zed = prev.callPackage ./zed { };
  go-nfsd = prev.callPackage ./go-nfsd { };
  broker = prev.callPackage ./broker { };
  brim = prev.callPackage ./brim { };
  osquery-bin = prev.callPackage ./osquery-bin { };
  ghq = prev.callPackage ./ghq { };
  nvdtools = prev.callPackage ./nvdtools { };
  deepsea = prev.callPackage ./deepsea { };
}
