{ pkgs }:
with pkgs;
paths: script: extra:
pkgs.writers.writeBash (builtins.baseNameOf script) ''
  export PATH="${lib.makeBinPath paths}"
  set -xeuo pipefail

  ${extra}
  ${lib.fileContents script}
''
