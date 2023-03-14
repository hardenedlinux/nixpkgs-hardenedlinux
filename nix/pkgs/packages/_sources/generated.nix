# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  broker = {
    pname = "broker";
    version = "78498fefb7142b47c3a59ec75ca66e73186bbbee";
    src = fetchFromGitHub ({
      owner = "zeek";
      repo = "broker";
      rev = "78498fefb7142b47c3a59ec75ca66e73186bbbee";
      fetchSubmodules = true;
      sha256 = "sha256-WKNJF5zTgzQFm74hMtcXaY6GdpeUitguxQrmO+xq8H0=";
    });
    date = "2023-03-12";
  };
  caretaker = {
    pname = "caretaker";
    version = "v0.2.4";
    src = fetchFromGitHub ({
      owner = "grego";
      repo = "caretaker";
      rev = "v0.2.4";
      fetchSubmodules = false;
      sha256 = "sha256-xP3AfwD9Er0TolAN65NfC2GkC1KlpcyV1J68KjBBEwU=";
    });
  };
  chatgpt-web = {
    pname = "chatgpt-web";
    version = "cf788b190a323a453173c08cab46de7a0c5356bc";
    src = fetchFromGitHub ({
      owner = "Chanzhaoyu";
      repo = "chatgpt-web";
      rev = "cf788b190a323a453173c08cab46de7a0c5356bc";
      fetchSubmodules = false;
      sha256 = "sha256-BD15eLxJy9FSWobJEtSQSZOfdVpOvgdzn42apMML9/s=";
    });
    date = "2023-03-13";
  };
  gptcommit = {
    pname = "gptcommit";
    version = "v0.3.0";
    src = fetchFromGitHub ({
      owner = "zurawiki";
      repo = "gptcommit";
      rev = "v0.3.0";
      fetchSubmodules = false;
      sha256 = "sha256-9ExlInX1DbuywexxzuhxD/dmr5yKk3/NyxbZj/uBOCY=";
    });
  };
  koodo-reader = {
    pname = "koodo-reader";
    version = "8e8d0693659fe0c62c13865054250aeca429f83c";
    src = fetchFromGitHub ({
      owner = "troyeguo";
      repo = "koodo-reader";
      rev = "8e8d0693659fe0c62c13865054250aeca429f83c";
      fetchSubmodules = false;
      sha256 = "sha256-ZM+ALDJ6jG9JRUyo+C3W9AAfv41y6+QhKVN6lmwE9uM=";
    });
    date = "2023-02-19";
  };
  koodo-reader-appimage = {
    pname = "koodo-reader-appimage";
    version = "1.5.2";
    src = fetchurl {
      url = "https://github.com/troyeguo/koodo-reader/releases/download/v1.5.2/Koodo-Reader-1.5.2.AppImage";
      sha256 = "sha256-mP+uYcaUfa9nFnDa/GQtiO5bqVAa1cuMKajmDGglBY0=";
    };
  };
  nix-unstable-installer = {
    pname = "nix-unstable-installer";
    version = "nix-2.15.0pre20230310_208c855";
    src = fetchurl {
      url = "https://github.com/numtide/nix-unstable-installer/releases/download/nix-2.15.0pre20230310_208c855/install";
      sha256 = "sha256-nRg4nDp0Z+2Q6OPDGQIs4EBd6GoXCM2SPuFngr0yzMM=";
    };
  };
  osquery = {
    pname = "osquery";
    version = "5.2.2";
    src = fetchurl {
      url = "https://github.com/osquery/osquery/releases/download/5.2.2/osquery_5.2.2-1.linux_amd64.deb";
      sha256 = "sha256-i8DK5bNQlLoeAhatT5qRGMCFDgP/ArDbQKs0fPdccWM=";
    };
  };
  sslproxy = {
    pname = "sslproxy";
    version = "30ed5b420002c8f1ac6f5c865373baa1e46bc4b8";
    src = fetchFromGitHub ({
      owner = "sonertari";
      repo = "SSLproxy";
      rev = "30ed5b420002c8f1ac6f5c865373baa1e46bc4b8";
      fetchSubmodules = false;
      sha256 = "sha256-aUU21Blcn5mT40O090BybN2nnxnCLLayKFY0PC+tHmw=";
    });
    date = "2022-12-26";
  };
  tuc = {
    pname = "tuc";
    version = "6dc3db10b8139d3197f864390056db677694558a";
    src = fetchFromGitHub ({
      owner = "riquito";
      repo = "tuc";
      rev = "6dc3db10b8139d3197f864390056db677694558a";
      fetchSubmodules = false;
      sha256 = "sha256-cjL9Mn8hrIQbHqt5M/DZ3oJQVVZTicrq5U4sRkWjyG8=";
    });
    date = "2023-03-01";
  };
  watchexec-simple = {
    pname = "watchexec-simple";
    version = "2ce685a1804d6ffed2c1c20abff2a9cf648c7188";
    src = fetchFromGitHub ({
      owner = "kurtbuilds";
      repo = "watchexec-simple";
      rev = "2ce685a1804d6ffed2c1c20abff2a9cf648c7188";
      fetchSubmodules = false;
      sha256 = "sha256-AOweMMWuJx9mtSss5Iett0fTVBoZrjCaDGnzOO8RrMw=";
    });
    date = "2022-11-24";
  };
  zeek-language-server = {
    pname = "zeek-language-server";
    version = "e78a3334579f54ca3e1ea86ddead323db24ad11c";
    src = fetchFromGitHub ({
      owner = "bbannier";
      repo = "zeek-language-server";
      rev = "e78a3334579f54ca3e1ea86ddead323db24ad11c";
      fetchSubmodules = true;
      sha256 = "sha256-yPVXPPvU322bPHKriTYKiJyeyUpoH0hnqU4cUEmvBkA=";
    });
    date = "2023-03-06";
  };
  zui = {
    pname = "zui";
    version = "1.0.0";
    src = fetchurl {
      url = "https://github.com/brimdata/zui/releases/download/v1.0.0/zui_1.0.0_amd64.deb";
      sha256 = "sha256-QIjpf3CDUcLS2RUL0veqTxoBzipqQH6MHKDbFa9eEFY=";
    };
  };
}
