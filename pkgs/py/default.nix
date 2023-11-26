{
  python3Packages,
  python3,
  lib,
  __inputs__,
  broker,
}:
let
  inherit (lib) makeScope;
  inherit (python3Packages) newScope;
  inherit (__inputs__) callPackagesWithOmnibus;
in
(makeScope newScope (selfScope: callPackagesWithOmnibus selfScope ./.)).overrideScope (_: _: {inherit broker;} )
