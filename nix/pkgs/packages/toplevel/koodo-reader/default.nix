{
  lib,
  nixpkgs-hardenedlinux-sources,
  buildYarnPackage,
  openssl,
}:
buildYarnPackage {
  inherit (nixpkgs-hardenedlinux-sources.koodo-reader) pname src version;
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
  meta = with lib; {
    description = "A modern ebook manager and reader with sync and backup capacities for Windows, macOS, Linux and Web";
    homepage = "https://github.com/troyeguo/koodo-reader";
    license = licenses.agpl3;
    platforms = platforms.linux;
  };
}
