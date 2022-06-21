final: prev: {
  go-nfsd = prev.callPackage ./go-nfsd {};
  tc-redirect-tap = prev.callPackage ./tc-redirect-tap {};
  zed = prev.callPackage ./zed {};
  # firecracker-task-driver = prev.callPackage ./firecracker-task-driver {};
}
