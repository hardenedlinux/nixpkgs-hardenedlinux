{ inputs
, channels
, self
}:
let
  eval = import "${inputs.devshell}/modules" channels.nixpkgs;
  configuration = {
    name = channels.nixpkgs.lib.mkDefault "devshell";
    imports =
      let
        devshell = import ./. {
          inherit inputs;
          pkgs = channels.nixpkgs;
        };
      in
        devshell.modules ++ devshell.exportedModules;
  };
in
(
  eval {
    inherit configuration;
    extraSpecialArgs = { inherit self inputs; };
  }
)
.shell
