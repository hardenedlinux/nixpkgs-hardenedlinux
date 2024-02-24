{ inputs, cell }:
{
  loader = pkgs: _: {
    inherit (import ./packages/_loader.nix { inherit inputs pkgs; })
      toplevel
      python
      ;
  };
  default =
    pkgs: _:
    (import ./packages/_loader.nix { inherit inputs pkgs; }).toplevel
    // {
      osquery-vm-tests = pkgs.callPackage ./nixosModules/osquery/nixos-test.nix {
        makeTest = import (pkgs.path + "/nixos/tests/make-test-python.nix");
        inherit inputs;
      };
      nixpkgs-hardenedlinux-sources =
        (import ./packages/_sources/pkgs/generated.nix {
          inherit (pkgs)
            fetchgit
            fetchurl
            fetchFromGitHub
            dockerTools
            ;
        })
        // (import ./packages/_sources/go/generated.nix {
          inherit (pkgs)
            fetchgit
            fetchurl
            fetchFromGitHub
            dockerTools
            ;
        });
    };

  python =
    pkgs: prev:
    let
      packages = (import ./packages/_loader.nix { inherit inputs pkgs; }).python;
    in
    {
      nixpkgs-hardenedlinux-python-sources =
        import ./packages/python/_sources/generated.nix
          {
            inherit (pkgs)
              fetchgit
              fetchurl
              fetchFromGitHub
              dockerTools
              ;
          };

      python3 = prev.python3.override (old: {
        packageOverrides = pkgs.lib.composeExtensions (old.packageOverrides
          or (_: _: { })
        ) packages;
      });

      python3Packages = prev.python3Packages.override (old: {
        overrides = prev.lib.composeExtensions (old.packageOverrides or (_: _: { })
          ) packages;
      });
    };
}
