{
  inputs,
  cell,
}: {
  default = final: prev: {
    nixpkgs-hardenedlinux-pkgs-sources = prev.callPackage ./packages/_sources/generated.nix {};
    broker = prev.callPackage ./packages/broker {};
    brim = prev.callPackage ./packages/brim {};
    osquery-bin = prev.callPackage ./packages/osquery-bin {};
    deepsea = prev.callPackage ./packages/deepsea {};
    tuc = prev.callPackage ./packages/tuc {};
    feishu = prev.callPackage ./packages/feishu {};
    caretaker = prev.callPackage ./packages/caretaker {};
    watchexec-simple = prev.callPackage ./packages/watchexec-simple {};
    zeek-language-server = prev.callPackage ./packages/zeek-language-server {};
    sslproxy = prev.callPackage ./packages/SSLproxy {};
  };
  tests = final: prev: {
    osquery-vm-tests = prev.callPackage ./nixosModules/osquery/nixos-test.nix {
      makeTest = import (prev.path + "/nixos/tests/make-test-python.nix");
      inherit inputs;
    };
  };
}
