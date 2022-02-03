{ pkgs
, lib
, budUtils
, inputs
, ...
}:
{
  bud.cmds =
    with pkgs;
    {
      gomod2nix = {
        writer = budUtils.runner [ git gomod2nix coreutils ];
        synopsis = "gomod2nix";
        help = "updating gomod2nix.toml for packages";
        preScript = ''
          export zed_url="${pkgs.zed.meta.homepage}"
          export gonfsd_url="${pkgs.go-nfsd.meta.homepage}"

          urls=("$zed_url" "$gonfs_url")
          names=("zed" "go-nfsd")
        '';
        script = ./gomod2nix.bash;
      };
      nvfetcher = {
        writer = budUtils.runner [ git nvfetcher-bin coreutils ];
        synopsis = "nvfetcher";
        help = "updating nvfetcher sources.toml";
        preScript = ''
          export NIX_PATH=nixpkgs=${pkgs.path}
        '';
        script = ./nvfetcher.bash;
      };
      gh-nix-update = {
        writer = budUtils.runner [ gnused findutils ];
        synopsis = "gh-nix-update";
        help = "nix develop github:hardenedlinux/nixpkgs-hardenedlinux -c update nvfetcher --no-write-lock-file";
        description = "update your nix verison of Github Action";
        preScript = ''
          export nix_version=${
          toString
          nixpkgs-hardenedlinux-sources.nix-unstable-installer.src.urls
        }
        '';
        script = ./gh-nix-update.bash;
      };
    };
}
