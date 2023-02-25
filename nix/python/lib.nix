{
  inputs,
  cell,
}: {
  nixpkgs = import inputs.cells.common.lib.nixpkgs.path {
    config = {
      allowUnfree = true;
    };
    inherit (inputs.nixpkgs) system;
    overlays = [
      cell.overlays.default
      (final: prev: {})
    ];
  };
}
