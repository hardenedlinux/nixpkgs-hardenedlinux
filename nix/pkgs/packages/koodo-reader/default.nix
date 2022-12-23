{
  lib,
  nixpkgs-hardenedlinux-pkgs-sources,
  buildYarnPackage,
  openssl,
}:
buildYarnPackage {
  inherit (nixpkgs-hardenedlinux-pkgs-sources.koodo-reader) src version;
  buildInputs = [openssl];
  installPhase = ''
  cp -r build $out
'';
  NODE_OPTIONS = "--openssl-legacy-provider";
  yarnBuild = ''
    yarn install --offline --frozen-lockfile --ignore-engines --ignore-scripts --no-progress
    patchShebangs node_modules
    export PATH=$PWD/node_modules/.bin:$PATH
    yarn build
  '';
}
