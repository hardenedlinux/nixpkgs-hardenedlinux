{ inputs }:
final: prev: {
  osquery-vm-tests = prev.callPackage ../../tests/osquery {
    makeTest = import (prev.path + "/nixos/tests/make-test-python.nix");
    inherit inputs;
  };
}
