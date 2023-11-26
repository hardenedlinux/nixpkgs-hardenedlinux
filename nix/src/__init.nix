# SPDX-FileCopyrightText: 2023 The omnibus Authors
#
# SPDX-License-Identifier: MIT

{
  inputs,
  eachSystem,
  omnibus,
}:
let
  inherit ((omnibus.pops.load { }).load.inputs) haumea;
in
(omnibus.pops.load {
  src = ./.;
  loader = with haumea; [ (matchers.nix loaders.scoped) ];
  inputs = {
    inherit inputs eachSystem;
    projectDir = ../..;
  };
})
