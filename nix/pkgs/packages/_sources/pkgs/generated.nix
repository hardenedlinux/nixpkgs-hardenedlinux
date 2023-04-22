# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  broker = {
    pname = "broker";
    version = "58114204003c32b6bdd2e6c473ba9c8b5c9361b6";
    src = fetchFromGitHub ({
      owner = "zeek";
      repo = "broker";
      rev = "58114204003c32b6bdd2e6c473ba9c8b5c9361b6";
      fetchSubmodules = true;
      sha256 = "sha256-ZeKIeIOJirBj2TqBv9xWkosEj8lt8J0+mj9guYBH078=";
    });
    date = "2023-04-14";
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
    version = "226ce2bdedaca0abca5eb8014044a375932c3710";
    src = fetchFromGitHub ({
      owner = "Chanzhaoyu";
      repo = "chatgpt-web";
      rev = "226ce2bdedaca0abca5eb8014044a375932c3710";
      fetchSubmodules = false;
      sha256 = "sha256-OBZqwpc1YYn9KymYjJbuhgFz8QUQIbyPPiOMn+T4fls=";
    });
    date = "2023-04-17";
  };
  gptcommit = {
    pname = "gptcommit";
    version = "v0.5.7";
    src = fetchFromGitHub ({
      owner = "zurawiki";
      repo = "gptcommit";
      rev = "v0.5.7";
      fetchSubmodules = false;
      sha256 = "sha256-ymG0D/geYH0o4fBzggeJH41fwZnO3THUV8ipk5GfwQc=";
    });
  };
  koodo-reader = {
    pname = "koodo-reader";
    version = "fb78037ca50a5969e2ed4cc5499ba5bfa4f3ab6a";
    src = fetchFromGitHub ({
      owner = "troyeguo";
      repo = "koodo-reader";
      rev = "fb78037ca50a5969e2ed4cc5499ba5bfa4f3ab6a";
      fetchSubmodules = false;
      sha256 = "sha256-pV5DG533tlL/GWS3y+0ehuaZCEF5Q80qHpwLhhPy2bs=";
    });
    date = "2023-04-16";
  };
  nix-unstable-installer = {
    pname = "nix-unstable-installer";
    version = "nix-2.16.0pre20230414_92346d1";
    src = fetchurl {
      url = "https://github.com/numtide/nix-unstable-installer/releases/download/nix-2.16.0pre20230414_92346d1/install";
      sha256 = "sha256-WofjlJZeioULBdP2aiPMgN0DNnW0mvFlqs5QYkH9+yc=";
    };
  };
  openproject = {
    pname = "openproject";
    version = "f3782f5071ae25aeea15a0c3647701817645af09";
    src = fetchFromGitHub ({
      owner = "opf";
      repo = "openproject";
      rev = "f3782f5071ae25aeea15a0c3647701817645af09";
      fetchSubmodules = false;
      sha256 = "sha256-uWzxy1ndXdq0lRIi7kEU63uh2UxSqozk+iHmss4TtGc=";
    });
    date = "2023-04-21";
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
    version = "6c1418b02bc1fcbe2104c06365333261327b7bc4";
    src = fetchFromGitHub ({
      owner = "riquito";
      repo = "tuc";
      rev = "6c1418b02bc1fcbe2104c06365333261327b7bc4";
      fetchSubmodules = false;
      sha256 = "sha256-CUHgDD7ltvbD7hOCeeSfQfiF0T+QzYTvWvZ9w1N7oKA=";
    });
    date = "2023-04-01";
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
  yakgpt = {
    pname = "yakgpt";
    version = "ef4ff333affb1173e902cac3930db6592dc698f2";
    src = fetchFromGitHub ({
      owner = "yakGPT";
      repo = "yakGPT";
      rev = "ef4ff333affb1173e902cac3930db6592dc698f2";
      fetchSubmodules = false;
      sha256 = "sha256-9HM00RCM5awg1QvoUXVwhCMGxZ4gkOJhAoUrEXqpw2M=";
    });
    date = "2023-04-16";
  };
  zeek-language-server = {
    pname = "zeek-language-server";
    version = "dcefb31bcea2b90003205582d7878ce897cbc9f2";
    src = fetchFromGitHub ({
      owner = "bbannier";
      repo = "zeek-language-server";
      rev = "dcefb31bcea2b90003205582d7878ce897cbc9f2";
      fetchSubmodules = true;
      sha256 = "sha256-3wO71xIP2wRWKC1kWf6LlP4Ng/DN4tTFiyorYcpRpro=";
    });
    date = "2023-04-11";
  };
  zui = {
    pname = "zui";
    version = "1.0.1";
    src = fetchurl {
      url = "https://github.com/brimdata/zui/releases/download/v1.0.1/zui_1.0.1_amd64.deb";
      sha256 = "sha256-gdCqZqsagBOYSYsOFsxF44G+0IBaQyX/gDimddOhnlM=";
    };
  };
}
