final: prev: {
  zed = prev.callPackage ./zed {};
  go-nfsd = prev.callPackage ./go-nfsd {};
  broker = prev.callPackage ./broker {};
  brim = prev.callPackage ./brim {};
  osquery-bin = prev.callPackage ./osquery-bin {};
  nvdtools = prev.callPackage ./nvdtools {};
  deepsea = prev.callPackage ./deepsea {};
  container-structure-test = prev.callPackage ./container-structure-test {};
}
