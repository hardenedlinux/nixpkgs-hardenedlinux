# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  broker = {
    pname = "broker";
    version = "21219561bd2db50f7da4c1b7c3d9e54fa56f9fba";
    src = fetchFromGitHub {
      owner = "zeek";
      repo = "broker";
      rev = "21219561bd2db50f7da4c1b7c3d9e54fa56f9fba";
      fetchSubmodules = true;
      sha256 = "sha256-4mWkoG472y6dvyhzIxdPGA9lRcKPTzNeX2BVe5jveJA=";
    };
    date = "2023-08-28";
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
    version = "f7a6fa987322d800bd058f7ffa2641361c53b12d";
    src = fetchFromGitHub {
      owner = "Yidadaa";
      repo = "ChatGPT-Next-Web";
      rev = "f7a6fa987322d800bd058f7ffa2641361c53b12d";
      fetchSubmodules = false;
      sha256 = "sha256-1a0w+U5/aRN4nmCLzvW57kUiKBBwCRiHqonFRe0NDkI=";
    };
    date = "2023-09-07";
  };
  chatgpt-web = {
    pname = "chatgpt-web";
    version = "2b2efe2f1505653c34da7ad51a8e29e4a8c3ea66";
    src = fetchFromGitHub {
      owner = "Chanzhaoyu";
      repo = "chatgpt-web";
      rev = "2b2efe2f1505653c34da7ad51a8e29e4a8c3ea66";
      fetchSubmodules = false;
      sha256 = "sha256-Gkm/SygqCfz03uPr5ZcggsgH/Xze0UdJzhcDwwxj3Lo=";
    };
    date = "2023-08-09";
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
    version = "422f998250142313a65fc8ef29ece82b68be354d";
    src = fetchFromGitHub {
      owner = "troyeguo";
      repo = "koodo-reader";
      rev = "422f998250142313a65fc8ef29ece82b68be354d";
      fetchSubmodules = false;
      sha256 = "sha256-I5AlZp+WQ8JoqNuARWdkkDHdgXvDYcKjz5z005iCZdU=";
    };
    date = "2023-09-03";
  };
  nix-unstable-installer = {
    pname = "nix-unstable-installer";
    version = "nix-2.18.0pre20230810_a1fdc68";
    src = fetchurl {
      url = "https://github.com/numtide/nix-unstable-installer/releases/download/nix-2.18.0pre20230810_a1fdc68/install";
      sha256 = "sha256-QHUH+joNNc5reirC8h6wBDzwToWFj5GCWrY7ix0+zhY=";
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
    version = "621d0a73b1b8fbf8ec4743b5d9f34aa48e3b8496";
    src = fetchFromGitHub {
      owner = "bbannier";
      repo = "zeek-language-server";
      rev = "621d0a73b1b8fbf8ec4743b5d9f34aa48e3b8496";
      fetchSubmodules = true;
      sha256 = "sha256-rf6JNro41NOftT/5PB9bH/lG1TFcd+o240SB+ObYROI=";
    };
    date = "2023-09-06";
  };
}
