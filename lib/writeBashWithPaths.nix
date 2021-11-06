{ pkgs }:
with pkgs;
paths: script:
pkgs.writers.writeBash (builtins.baseNameOf script) ''
  export PATH="${lib.makeBinPath paths}"
  source ${script}
''
