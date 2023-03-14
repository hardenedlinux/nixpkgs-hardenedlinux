{
  inputs,
  cell,
}: {
  default = final: prev: {
    nixpkgs-hardenedlinux-pkgs-sources = prev.callPackage ./packages/_sources/generated.nix {};
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
    koodo-reader-appimage = prev.callPackage ./packages/koodo-reader/appimage.nix {};
    koodo-reader = prev.callPackage ./packages/koodo-reader {};
    chatgpt-web = prev.callPackage ./packages/chatgpt-web {};
  };
  tests = final: prev: {
    osquery-vm-tests = prev.callPackage ./nixosModules/osquery/nixos-test.nix {
      makeTest = import (prev.path + "/nixos/tests/make-test-python.nix");
      inherit inputs;
    };
  };
}
