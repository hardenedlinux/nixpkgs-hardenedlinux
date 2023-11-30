{ inputs, cell }:
let
  l = nixpkgs.lib // builtins;
  inherit (inputs) nixpkgs std;
in
l.mapAttrs (_: std.lib.dev.mkShell) {
  default = {
    name = "nixpkgs-hardenedlinux";

    imports = [ cell.shellProfiles.default ];

    nixago = [ cell.nixago.treefmt.default ];

    packages = [ nixpkgs.nixci ];
  };
}
