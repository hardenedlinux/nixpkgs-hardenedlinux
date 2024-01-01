# SPDX-FileCopyrightText: 2023 The omnibus Authors
#
# SPDX-License-Identifier: MIT

{
  inputs,
  eachSystem,
  omnibus,
}:
let
  inherit ((omnibus.pops.load { }).load.inputs) haumea lib;
in
(omnibus.pops.load {
  src = ./.;
  loader = with haumea; [ (matchers.nix loaders.scoped) ];
  transformer = [ omnibus.lib.haumea.removeTopDefault ];
  inputs = {
    inherit inputs eachSystem;
    projectDir = ../..;
  };
})
