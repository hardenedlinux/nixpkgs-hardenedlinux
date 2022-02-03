inputs: final: prev:
with inputs;
{
  check_journal = check_journal.defaultPackage."x86_64-linux";
  inherit (inputs.microvm.packages."x86_64-linux") microvm-kernel;
}
