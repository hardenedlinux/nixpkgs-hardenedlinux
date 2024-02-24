# SPDX-FileCopyrightText: 2023 The omnibus Authors
#
# SPDX-License-Identifier: MIT

let
  lock = builtins.fromJSON (builtins.readFile ./flake.lock);
  omnibus = import (
    (fetchTarball {
      url = "https://github.com/gtrunsec/omnibusSrc/archive/${lock.nodes.omnibusSrc.locked.rev}.tar.gz";
      sha256 = lock.nodes.omnibusSrc.locked.narHash;
    })
  );
in
omnibus.call-flake ./.
