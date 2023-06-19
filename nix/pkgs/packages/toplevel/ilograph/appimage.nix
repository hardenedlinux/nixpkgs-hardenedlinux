{}
# {
#   lib,
#   stdenv,
#   fetchurl,
#   appimageTools,
#   nixpkgs-hardenedlinux-sources,
#   writeScriptBin,
#   runtimeShell,
#   xvfb-run,
# }: let
#   pname = "ilograph";
#   appimageContents = appimageTools.extractType2 {
#     inherit pname;
#     inherit (nixpkgs-hardenedlinux-sources.ilograph-appimage) version src;
#   };
#   bin =   appimageTools.wrapType2 rec {
#     inherit pname;
#     inherit (nixpkgs-hardenedlinux-sources.ilograph-appimage) version src;
#     extraPkgs = pkgs:
#       with pkgs; [];
#     extraInstallCommands = ''
#       mv $out/bin/${pname}-${version} $out/bin/${pname}
#       install -m 444 -D ${appimageContents}/${pname}.desktop $out/share/applications/ilograph.desktop
#       substituteInPlace $out/share/applications/ilograph.desktop \
#         --replace 'Exec=AppRun' 'Exec=${placeholder "out"}/bin/${pname}'
#     '';
#     meta = with lib; {
#       description = "Interactive System Diagrams";
#       homepage = "https://www.ilograph.com/desktop/";
#       platforms = platforms.linux;
#     };
#   };
# in writeScriptBin pname ''
#     #!${runtimeShell}
#     # Electron really wants a configuration directory to not die with:
#     # "Error: Failed to get 'appData' path"
#     # so we give it some temp dir as XDG_CONFIG_HOME
#     tmpdir=$(mktemp -d)
#     function cleanup {
#       rm -rf "$tmpdir"
#     }
#     trap cleanup EXIT
#     # app needs to run in a virtual X session, because Electron
#     # refuses to work and dies with an unhelpful error message otherwise:
#     # "The futex facility returned an unexpected error code."
#     XDG_CONFIG_HOME="$tmpdir" ${xvfb-run}/bin/xvfb-run ${bin}/bin/ilograph $@
#   ''

