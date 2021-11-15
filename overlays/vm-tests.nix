final: prev:
{
  osquery-vm-tests = prev.lib.optionalAttrs prev.stdenv.isLinux (import ../tests/osquery {
    makeTest = import (prev.path + "/nixos/tests/make-test-python.nix");
    pkgs = final;
  });
}
