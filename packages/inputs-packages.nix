{ inputs }:
final: prev: {
  check_journal = inputs.check_journal.defaultPackage."x86_64-linux";
  inherit (inputs.microvm.packages."x86_64-linux") microvm-kernel;
}
