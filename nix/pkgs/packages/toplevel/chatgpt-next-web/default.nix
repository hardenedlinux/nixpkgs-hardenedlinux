{
  lib,
  nixpkgs-hardenedlinux-sources,
  buildYarnPackage,
  applyPatches,
}:
buildYarnPackage {
  inherit (nixpkgs-hardenedlinux-sources.chatgpt-next-web) pname version;
  src = applyPatches {
    src = nixpkgs-hardenedlinux-sources.chatgpt-next-web.src;
    patches = [
      ./version.patch
    ];
  };
  buildInputs = [];
  # # NODE_OPTIONS = "--openssl-legacy-provider";
  yarnBuild = ''
    export HOME=$PWD
    yarn install --offline --frozen-lockfile --ignore-engines --ignore-scripts --no-progress
    yarn build
  '';
  installPhase = ''
    cp -r app $out
    chmod -R u+w $out
    cp -r {.next,public} $out/.
    mv $out/.next/standalone/* $out/.
  '';
  meta = with lib; {
    description = "A well-designed cross-platform ChatGPT UI (Web / PWA / Linux / Win / MacOS). 一键拥有你自己的跨平台 ChatGPT 应用";
    homepage = "https://github.com/Yidadaa/ChatGPT-Next-Web";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
