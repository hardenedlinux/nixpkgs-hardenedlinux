#!/usr/bin/env nix-script-bash
#!runtimeInputs statix

for path in $(find "$PRJ_ROOT" -name '*.nix'  -not -name 'generated.nix')
do
    statix "$@" "$path"
done
