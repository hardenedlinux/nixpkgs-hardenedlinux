#!/usr/bin/env bash
cd $PRJ_ROOT/nix
nvfetcher -c ./sources.toml "$@"
