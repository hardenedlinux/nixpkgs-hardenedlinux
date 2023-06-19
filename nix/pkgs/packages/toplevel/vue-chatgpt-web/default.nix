{
  lib,
  nixpkgs-hardenedlinux-sources,
  mkPnpmPackage,
  buildEnv,
}: let
  meta = with lib; {
    description = "用 Express 和 Vue3 搭建的 ChatGPT 演示网页";
    homepage = "https://github.com/Chanzhaoyu/chatgpt-web";
    license = licenses.mit;
    platforms = platforms.linux;
  };
  app = mkPnpmPackage {
    inherit (nixpkgs-hardenedlinux-sources.chatgpt-web) pname src version;
    inherit meta;
  };
  service =
    (mkPnpmPackage {
      inherit (nixpkgs-hardenedlinux-sources.chatgpt-web) pname version;
      src = nixpkgs-hardenedlinux-sources.chatgpt-web.src + "/service";
      inherit meta;
      copyPnpmStore = true;
      distDir = "build";
    })
    .overrideAttrs (old: {
      postInstall = ''
        mkdir -p $out
        cp -r node_modules $out/node_modules
      '';
    });
in
  buildEnv {
    name = "chatgpt-web";
    paths = [];
    postBuild = ''
    cp ${app}/ $out/public
    cp -r ${service} $out/build
    cp -r ${service}/node_modules $out/node_modules
    cp -r ${nixpkgs-hardenedlinux-sources.chatgpt-web.src}/service/* $out/.
  '';
  }
