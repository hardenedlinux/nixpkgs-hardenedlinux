#!/usr/bin/env bash

for path in $(find "$FLAKEROOT/.github/workflows" -type f)
do
    sed -i 's|https://github.com/numtide/nix-.*./releases/download/nix-.*.|'"$nix_version"'|' $path
done
