# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  broker = {
    pname = "broker";
    version = "86ed39b80c272cff44bb95f58eeda1bc5ff6f65c";
    src = fetchFromGitHub {
      owner = "zeek";
      repo = "broker";
      rev = "86ed39b80c272cff44bb95f58eeda1bc5ff6f65c";
      fetchSubmodules = true;
      sha256 = "sha256-/rRTicBsSQR1G+wpDZigpp9+BJIgS6tRLwJjpTzXwVA=";
    };
    date = "2023-10-13";
  };
  caretaker = {
    pname = "caretaker";
    version = "v0.2.4";
    src = fetchFromGitHub {
      owner = "grego";
      repo = "caretaker";
      rev = "v0.2.4";
      fetchSubmodules = false;
      sha256 = "sha256-xP3AfwD9Er0TolAN65NfC2GkC1KlpcyV1J68KjBBEwU=";
    };
  };
  chatgpt-next-web = {
    pname = "chatgpt-next-web";
    version = "06e043d3f1979c92d9fb0bd8068a78ffaaa9f108";
    src = fetchFromGitHub {
      owner = "Yidadaa";
      repo = "ChatGPT-Next-Web";
      rev = "06e043d3f1979c92d9fb0bd8068a78ffaaa9f108";
      fetchSubmodules = false;
      sha256 = "sha256-OoBPbNgxWXlgMbAoHWFGTnok8GC4ddl4erHAfUVwOBY=";
    };
    date = "2023-10-13";
  };
  chatgpt-web = {
    pname = "chatgpt-web";
    version = "a6605e8a57750903f2a720ead630e25368667309";
    src = fetchFromGitHub {
      owner = "Chanzhaoyu";
      repo = "chatgpt-web";
      rev = "a6605e8a57750903f2a720ead630e25368667309";
      fetchSubmodules = false;
      sha256 = "sha256-zueRv9ztYbyrV1L0QbUFr9dtneGeWCH7v8CfNknFaeA=";
    };
    date = "2023-10-11";
  };
  firecracker-task-driver = {
    pname = "firecracker-task-driver";
    version = "dbfdebbfff78794006eed9736a27b49c34278508";
    src = fetchFromGitHub {
      owner = "cneira";
      repo = "firecracker-task-driver";
      rev = "dbfdebbfff78794006eed9736a27b49c34278508";
      fetchSubmodules = false;
      sha256 = "sha256-gMaMZHEXnyx9DlkOx4pZ93UhANisRXDxGhKCV9HndHU=";
    };
    date = "2022-10-06";
  };
  gptcommit = {
    pname = "gptcommit";
    version = "v0.5.13";
    src = fetchFromGitHub {
      owner = "zurawiki";
      repo = "gptcommit";
      rev = "v0.5.13";
      fetchSubmodules = false;
      sha256 = "sha256-O0dqLN2wDXRIVcb9whlzK0BJOm/qhTH+nLpCwSUObng=";
    };
  };
  koodo-reader = {
    pname = "koodo-reader";
    version = "5955c67910ccc439f5e61ef26402fd46feec0977";
    src = fetchFromGitHub {
      owner = "troyeguo";
      repo = "koodo-reader";
      rev = "5955c67910ccc439f5e61ef26402fd46feec0977";
      fetchSubmodules = false;
      sha256 = "sha256-wbGn9Ir/SRXKcvSvNIteaLS+Ei96r9sT2f7uvQ8+dVQ=";
    };
    date = "2023-09-24";
  };
  nix-unstable-installer = {
    pname = "nix-unstable-installer";
    version = "nix-2.19.0pre20231007_c29b8ba";
    src = fetchurl {
      url = "https://github.com/numtide/nix-unstable-installer/releases/download/nix-2.19.0pre20231007_c29b8ba/install";
      sha256 = "sha256-N+n9XkMrAF35SW26AwWSLBKVVwVNWUeVvR3w/cVJvi4=";
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
    src = fetchFromGitHub {
      owner = "sonertari";
      repo = "SSLproxy";
      rev = "30ed5b420002c8f1ac6f5c865373baa1e46bc4b8";
      fetchSubmodules = false;
      sha256 = "sha256-aUU21Blcn5mT40O090BybN2nnxnCLLayKFY0PC+tHmw=";
    };
    date = "2022-12-26";
  };
  tuc = {
    pname = "tuc";
    version = "89ef29696a62357e33fa57c4bb33a9401d12c259";
    src = fetchFromGitHub {
      owner = "riquito";
      repo = "tuc";
      rev = "89ef29696a62357e33fa57c4bb33a9401d12c259";
      fetchSubmodules = false;
      sha256 = "sha256-VNp5tcZGsBltEPMbynep65uoZR/QqCGYoML8WrC8S7c=";
    };
    date = "2023-08-01";
  };
  watchexec-simple = {
    pname = "watchexec-simple";
    version = "7c4828fa41d9c0e61b8915c9a2131eae40e2ca6b";
    src = fetchFromGitHub {
      owner = "kurtbuilds";
      repo = "watchexec-simple";
      rev = "7c4828fa41d9c0e61b8915c9a2131eae40e2ca6b";
      fetchSubmodules = false;
      sha256 = "sha256-Ku/sZkOCAhE8bM+9qofhFC64SenbbPLWWe60xIfC3nU=";
    };
    date = "2023-07-03";
  };
  yakgpt = {
    pname = "yakgpt";
    version = "7675e969071c3e75a641c1ea42c933cd13215cb2";
    src = fetchFromGitHub {
      owner = "yakGPT";
      repo = "yakGPT";
      rev = "7675e969071c3e75a641c1ea42c933cd13215cb2";
      fetchSubmodules = false;
      sha256 = "sha256-nA03lQ5wpa7E5hH3deYTgAv2aD7SbW2sjuZg6KWtN0w=";
    };
    date = "2023-04-25";
  };
  zeek-language-server = {
    pname = "zeek-language-server";
    version = "f9c3bc3a37f9df9d7a0a5034a5f5a0ca62b54497";
    src = fetchFromGitHub {
      owner = "bbannier";
      repo = "zeek-language-server";
      rev = "f9c3bc3a37f9df9d7a0a5034a5f5a0ca62b54497";
      fetchSubmodules = true;
      sha256 = "sha256-COaYsQiBgJ3X7DFJBJKjVUWSR6fyij+dMGcSOG0291g=";
    };
    date = "2023-10-09";
  };
}
