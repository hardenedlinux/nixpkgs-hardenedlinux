{
  lib,
  nixpkgs-hardenedlinux-sources,
  buildYarnPackage,
  openssl,
}:
buildYarnPackage {
  inherit (nixpkgs-hardenedlinux-sources.yakgpt) pname src version;
  buildInputs = [ openssl ];
  installPhase = ''
    cp -r $src $out
    chmod -R u+w $out
    cp -r {node_modules,next-env.d.ts,.next} $out
  '';
  # NODE_OPTIONS = "--openssl-legacy-provider";
  yarnBuild = ''
    export HOME=$PWD
    yarn install --offline --frozen-lockfile --ignore-engines --ignore-scripts --no-progress
    patchShebangs node_modules
    export PATH=$PWD/node_modules/.bin:$PATH
    yarn build
  '';
  meta = with lib; {
    description = "Locally running, hands-free ChatGPT";
    homepage = "https://github.com/yakgpt/yakgpt";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
