final: prev: {
  go-nfsd = prev.callPackage ./go-nfsd {};
  tc-redirect-tap = prev.callPackage ./tc-redirect-tap {};
}
