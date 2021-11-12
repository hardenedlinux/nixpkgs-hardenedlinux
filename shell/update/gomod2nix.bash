names=("zed" "go-nfsd")
urls=("$zed_url" "$gonfs_url")
for name in "${names[@]}"; do
    for url in in "${urls[@]}"; do
        if [[ ! -d "/tmp/$name-gomod2nix" ]]; then
            git clone $url --depth=1 /tmp/$name-gomod2nix
        fi
        cd /tmp/$name-gomod2nix && git reset --hard && git fetch && git pull
        gomod2nix -dir .
        cp gomod2nix.toml $FLAKEROOT/packages/pkgs/$name/.
    done
done
