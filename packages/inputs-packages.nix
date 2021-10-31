inputs: final: prev:

{
  check_journal = inputs.check_journal.defaultPackage.${prev.system};
}
