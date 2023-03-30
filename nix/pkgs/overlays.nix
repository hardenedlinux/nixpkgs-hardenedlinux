{
  inputs,
  cell,
}: {
  default = final: prev: {
    nixpkgs-hardenedlinux-sources =
      (import ./packages/_sources/pkgs/generated.nix {
        inherit (prev) fetchgit fetchurl fetchFromGitHub dockerTools;
      })
      // (import ./packages/_sources/go/generated.nix {
        inherit (prev) fetchgit fetchurl fetchFromGitHub dockerTools;
      });

    gptcommit = prev.callPackage ./packages/gptcommit {};
    broker = prev.callPackage ./packages/broker {};
    zui = prev.callPackage ./packages/zui {};
    osquery-bin = prev.callPackage ./packages/osquery-bin {};
    deepsea = prev.callPackage ./packages/deepsea {};
    tuc = prev.callPackage ./packages/tuc {};
    feishu = prev.callPackage ./packages/feishu {};
    caretaker = prev.callPackage ./packages/caretaker {};
    watchexec-simple = prev.callPackage ./packages/watchexec-simple {};
    zeek-language-server = prev.callPackage ./packages/zeek-language-server {};
    sslproxy = prev.callPackage ./packages/SSLproxy {};
    # koodo-reader-appimage = prev.callPackage ./packages/koodo-reader/appimage.nix {};
    koodo-reader = prev.callPackage ./packages/koodo-reader {};
    go-chatgpt-web = prev.callPackage ./packages/go-chatgpt-web {};
    openproject = prev.callPackage ./packages/openproject {};

    go-nfsd = prev.callPackage ./packages/go-nfsd {};
    tc-redirect-tap = prev.callPackage ./packages/tc-redirect-tap {};
    zed = prev.callPackage ./packages/zed {};
    update-scripts = prev.callPackage ./packages/update-scripts {};
    container-structure-test = prev.callPackage ./packages/container-structure-test {};
    nvdtools = prev.callPackage ./packages/nvdtools {};
    zitadel-bin = prev.callPackage ./packages/zitadel/bin.nix {};
    vue-chatgpt-web = prev.callPackage ./packages/vue-chatgpt-web {};
  };
  tests = final: prev: {
    osquery-vm-tests = prev.callPackage ./nixosModules/osquery/nixos-test.nix {
      makeTest = import (prev.path + "/nixos/tests/make-test-python.nix");
      inherit inputs;
    };
  };
}
