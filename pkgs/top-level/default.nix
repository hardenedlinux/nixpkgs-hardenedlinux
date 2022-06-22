final: prev: {
  broker = prev.callPackage ./broker {};
  brim = prev.callPackage ./brim {};
  osquery-bin = prev.callPackage ./osquery-bin {};
  nvdtools = prev.callPackage ./nvdtools {};
  deepsea = prev.callPackage ./deepsea {};
  container-structure-test = prev.callPackage ./container-structure-test {};
  tuc = prev.callPackage ./tuc {};
  feishu = prev.callPackage ./feishu {};
  update-package = prev.callPackage ./update-package {};
  caretaker = prev.callPackage ./caretaker {};
  watchexec-simple = prev.callPackage ./watchexec-simple {};
}
