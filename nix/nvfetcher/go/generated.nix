# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  container-structure-test = {
    pname = "container-structure-test";
    version = "0c5cfe02944b6ab468980bc8e08eea36231a1dd1";
    src = fetchFromGitHub {
      owner = "GoogleContainerTools";
      repo = "container-structure-test";
      rev = "0c5cfe02944b6ab468980bc8e08eea36231a1dd1";
      fetchSubmodules = false;
      sha256 = "sha256-xVJsj2+jv7FBW0K/jNFpMc05t4mV6AgvdqZ9qtAXE0E=";
    };
    date = "2023-11-30";
  };
  go-nfsd = {
    pname = "go-nfsd";
    version = "b02df67ac6264f4a71e424288c84a9aa0a62c2a8";
    src = fetchFromGitHub {
      owner = "mit-pdos";
      repo = "go-nfsd";
      rev = "b02df67ac6264f4a71e424288c84a9aa0a62c2a8";
      fetchSubmodules = false;
      sha256 = "sha256-yRovu5H4gEo+Unk4ZxImasRKhitf1SXcfOUTDkrEprw=";
    };
    date = "2023-08-30";
  };
  nvdtools = {
    pname = "nvdtools";
    version = "d14ce526f176b589e8c26156618347faf7ffd7d4";
    src = fetchFromGitHub {
      owner = "facebookincubator";
      repo = "nvdtools";
      rev = "d14ce526f176b589e8c26156618347faf7ffd7d4";
      fetchSubmodules = false;
      sha256 = "sha256-QTUyhDgOKPaoL/S85UzLuN9Vs33WrNBwpZX9H3TlX9c=";
    };
    date = "2023-10-10";
  };
  tc-redirect-tap = {
    pname = "tc-redirect-tap";
    version = "6827f7b2f5e9ec675cb7dc9bbe4b201c228d565e";
    src = fetchFromGitHub {
      owner = "awslabs";
      repo = "tc-redirect-tap";
      rev = "6827f7b2f5e9ec675cb7dc9bbe4b201c228d565e";
      fetchSubmodules = false;
      sha256 = "sha256-hMnZVFDT/ftD0+iSQqHLqz8gfTjuQv55Kr4mR2ranFI=";
    };
    date = "2023-10-29";
  };
  zitadel-bin = {
    pname = "zitadel-bin";
    version = "v2.42.1";
    src = fetchurl {
      url = "https://github.com/zitadel/zitadel/releases/download/v2.42.1/zitadel-linux-amd64.tar.gz";
      sha256 = "sha256-nO286zR4KXzPyb6idXFCkMhVOG7mNVNgIhNGvDqJcB4=";
    };
  };
}
