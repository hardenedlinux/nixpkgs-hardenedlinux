inputs: final: prev:
with inputs;
{
  check_journal = check_journal.defaultPackage."${prev.system}";

}
