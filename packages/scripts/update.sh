#!/usr/bin/env bash
set -euo pipefail

function fetch_repo () {
    url="$1"
    repo_path="$2"

    mkdir -p "$repo_path"
    git clone --depth 1 "$url" "$repo_path" \
        || git --git-dir "$repo_path/.git" --work-tree "$repo_path" pull

    if [[ $? != 0 ]]; then
        echo "Failed to fetch '$url' with git, error code: $?"
        exit 2
    fi
}

GIT_CACHE="$PRJ_ROOT/.direnv/update/git"

mkcd () {
    echo "asdas"
}
