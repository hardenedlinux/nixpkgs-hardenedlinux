{
  description = "A very basic flake";

  inputs = {
    poetry2nix.url = "github:nix-community/poetry2nix";

    gomod2nix.url = "github:tweag/gomod2nix";

    xnlib.url = "github:gtrunsec/xnlib";

    crane.url = "github:ipetkov/crane";

    dream2nix.url = "github:nix-community/dream2nix";

    pypi-deps-db.url = "github:DavHau/pypi-deps-db";
    pypi-deps-db.flake = false;
    mach-nix.url = "github:DavHau/mach-nix";
    mach-nix.inputs.pypi-deps-db.follows = "pypi-deps-db";
  };
  outputs = {self, ...}: {};
}
