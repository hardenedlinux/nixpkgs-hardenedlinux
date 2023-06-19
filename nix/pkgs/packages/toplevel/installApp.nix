# copyright: https://discourse.nixos.org/t/help-with-error-only-hfs-file-systems-are-supported-on-ventura/25873/3
# https://github.com/ldeck/nix-home/blob/a9a758c242dc151d2969504366caa5cff8edd590/lib/defaults/apps/macOS/lib/app.nix
{
  # nix supplied
  pkgs,
  stdenv,
  lib,
  undmg,
  unzip,
  ...
}: {
  pname,
  version,
  appname ? pname,
  homepage ? "",
  src,
  postInstall ? "",
  sourceRoot ? ".",
  extraBuildInputs ? [],
  description ? "",
  ...
}:
stdenv.mkDerivation {
  name = "${pname}-${version}";
  version = "${version}";
  src = src;
  buildInputs = [unzip];
  unpackCmd = ''
    echo "File to unpack: $curSrc"
    if ! [[ "$curSrc" =~ \.dmg$ ]]; then return 1; fi
    mnt=$(mktemp -d -t ci-XXXXXXXXXX)

    function finish {
      echo "Detaching $mnt"
      /usr/bin/hdiutil detach $mnt -force
      rm -rf $mnt
    }
    trap finish EXIT

    echo "Attaching $mnt"
    /usr/bin/hdiutil attach -nobrowse -readonly $src -mountpoint $mnt

    echo "What's in the mount dir"?
    ls -la $mnt/

    echo "Copying contents"
    shopt -s extglob
    DEST="$PWD"
    (cd "$mnt"; cp -a !(Applications) "$DEST/")
  '';
  sourceRoot = sourceRoot;
  phases = ["unpackPhase" "installPhase"];
  installPhase =
    ''
      mkdir -p "$out/Applications/${appname}.app"
      cp -a ./. "$out/Applications/${appname}.app/"
    ''
    + postInstall;
  meta = {
    description = description;
    homepage = homepage;
    maintainers = ["ldeck <ldeck@example.com>"];
    platforms = lib.platforms.darwin;
  };
}
