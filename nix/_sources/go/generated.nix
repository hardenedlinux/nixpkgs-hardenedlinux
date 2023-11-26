# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  container-structure-test = {
    pname = "container-structure-test";
    version = "cc5bb29e518d14a89b4dd74ba2789d808d6a62d6";
    src = fetchFromGitHub {
      owner = "GoogleContainerTools";
      repo = "container-structure-test";
      rev = "cc5bb29e518d14a89b4dd74ba2789d808d6a62d6";
      fetchSubmodules = false;
      sha256 = "sha256-RaP5ylVUkWuThQalyX4bYhbB3sPvN7Kz9cO2IM/oxDs=";
    };
    date = "2023-11-21";
  };
  ghq = {
    pname = "ghq";
    version = "7163e61e2309a039241ad40b4a25bea35671ea6f";
    src = fetchFromGitHub {
      owner = "x-motemen";
      repo = "ghq";
      rev = "7163e61e2309a039241ad40b4a25bea35671ea6f";
      fetchSubmodules = false;
      sha256 = "sha256-ggTx5Kz9cRqOqxxzERv4altf7m1GlreGgOiYCnHyJks=";
    };
    date = "2023-04-17";
  };
  go-chatgpt-web = {
    pname = "go-chatgpt-web";
    version = "e6855125ee5523c3feaedb969996b22473b12690";
    src = fetchFromGitHub {
      owner = "869413421";
      repo = "chatgpt-web";
      rev = "e6855125ee5523c3feaedb969996b22473b12690";
      fetchSubmodules = false;
      sha256 = "sha256-CQUMB0gm8+RFpTuKxutihBI2xrNwaaexQhaa+vZSYE0=";
    };
    date = "2023-04-10";
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
  gst = {
    pname = "gst";
    version = "b4af138c9a2dfc6bb04d853cd045eff9a5d8b608";
    src = fetchFromGitHub {
      owner = "uetchy";
      repo = "gst";
      rev = "b4af138c9a2dfc6bb04d853cd045eff9a5d8b608";
      fetchSubmodules = false;
      sha256 = "sha256-NhbGHTYucfqCloVirkaDlAtQfhWP2cw4I+t/ysvvkR0=";
    };
    date = "2021-10-27";
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
  zed = {
    pname = "zed";
    version = "f530788f732472ed060ab320ea0e175690c47b4d";
    src = fetchFromGitHub {
      owner = "brimdata";
      repo = "zed";
      rev = "f530788f732472ed060ab320ea0e175690c47b4d";
      fetchSubmodules = false;
      sha256 = "sha256-b7X4inBKYDafDH+VE8OoNx3SF7NjpvA6hq/7ABEsiPw=";
    };
    date = "2023-11-22";
  };
  zitadel-bin = {
    pname = "zitadel-bin";
    version = "v2.41.4";
    src = fetchurl {
      url = "https://github.com/zitadel/zitadel/releases/download/v2.41.4/zitadel-linux-amd64.tar.gz";
      sha256 = "sha256-1jy2Azf+s7y6zXKLmca+YDJDqAY5T0lkDptzK3k7lVU=";
    };
  };
}
