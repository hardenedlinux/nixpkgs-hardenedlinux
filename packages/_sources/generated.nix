# This file was generated by nvfetcher, please do not modify it manually.
{
  fetchgit,
  fetchurl,
  fetchFromGitHub,
}: {
  aim = {
    pname = "aim";
    version = "v3.10.1";
    src = fetchFromGitHub {
      owner = "aimhubio";
      repo = "aim";
      rev = "v3.10.1";
      fetchSubmodules = false;
      sha256 = "sha256-rlDHID5Cyegrs+Dcf2Phze7Ig4EBgv41gFG09461KaU=";
    };
  };
  brim = {
    pname = "brim";
    version = "0.30.0";
    src = fetchurl {
      url = "https://github.com/brimdata/brim/releases/download/v0.30.0/Brim-0.30.0.deb";
      sha256 = "sha256-sN3w3M9DtVPQi+He7ZXZJr2K6vKHpdz9PJrKoNjrGJo=";
    };
  };
  broker = {
    pname = "broker";
    version = "d57b15eb89e4feed318bc2f963872447a81c8322";
    src = fetchFromGitHub {
      owner = "zeek";
      repo = "broker";
      rev = "d57b15eb89e4feed318bc2f963872447a81c8322";
      fetchSubmodules = true;
      sha256 = "sha256-3O9/6Mlf5x5Bmh3cw0CPaKbqVxyF1biq1z7Mr2uPXYc=";
    };
  };
  broker-to-json = {
    pname = "broker-to-json";
    version = "v_02";
    src = fetchFromGitHub {
      owner = "grigorescu";
      repo = "broker-to-json";
      rev = "v_02";
      fetchSubmodules = false;
      sha256 = "sha256-SROcIR2P5ixk4yDVwkUJczdbuU4STpmTyLNBCj6dEtg=";
    };
  };
  btest = {
    pname = "btest";
    version = "0.71";
    src = fetchurl {
      url = "https://pypi.io/packages/source/b/btest/btest-0.71.tar.gz";
      sha256 = "sha256-17JpGNgq917qNp1snF2I6teeid9RxCaM6nSYiQh9Ocw=";
    };
  };
  choochoo = {
    pname = "choochoo";
    version = "29750cdb9f87dc7a4b6e423df6e805e14ecae5e1";
    src = fetchFromGitHub {
      owner = "andrewcooke";
      repo = "choochoo";
      rev = "29750cdb9f87dc7a4b6e423df6e805e14ecae5e1";
      fetchSubmodules = false;
      sha256 = "sha256-/PjfY1thoILxpu3/PTmFRfzR4eFgraLbTXpVM54GXJk=";
    };
  };
  cliche = {
    pname = "cliche";
    version = "a13b7e9bf0c0e4f4073da03ae7f2273055232711";
    src = fetchFromGitHub {
      owner = "kootenpv";
      repo = "cliche";
      rev = "a13b7e9bf0c0e4f4073da03ae7f2273055232711";
      fetchSubmodules = false;
      sha256 = "sha256-wGBDylebd8DREU8LxgAy+r1MvuXlWbMRSspmMN466jQ=";
    };
  };
  container-structure-test = {
    pname = "container-structure-test";
    version = "59c5221e5a4e7e2c8680c273c25cb405d8f8eb8b";
    src = fetchFromGitHub {
      owner = "GoogleContainerTools";
      repo = "container-structure-test";
      rev = "59c5221e5a4e7e2c8680c273c25cb405d8f8eb8b";
      fetchSubmodules = false;
      sha256 = "sha256-+7GuTV6a3a+fG4Kqwcq4Ro4MPCeWb0PvY3mFbsCklVc=";
    };
  };
  durationpy = {
    pname = "durationpy";
    version = "0.5";
    src = fetchurl {
      url = "https://pypi.io/packages/source/d/durationpy/durationpy-0.5.tar.gz";
      sha256 = "sha256-XvlBa1J7UNci80ZVvs+3Xkkijrgvh7hV7RkRszFLVAg=";
    };
  };
  eZeeKonfigurator = {
    pname = "eZeeKonfigurator";
    version = "bd6de2ee9d7129cc0428e8c6b58111f651561305";
    src = fetchFromGitHub {
      owner = "esnet";
      repo = "eZeeKonfigurator";
      rev = "bd6de2ee9d7129cc0428e8c6b58111f651561305";
      fetchSubmodules = false;
      sha256 = "sha256-DBrdLaRvjH9lckAJwpSkyN6OlBuGZwsVoNWTK2uWsUA=";
    };
  };
  eZeeKonfigurator_client = {
    pname = "eZeeKonfigurator_client";
    version = "efbe39bb1e40a0332d37c3291ee3c8af1ff7678e";
    src = fetchFromGitHub {
      owner = "esnet";
      repo = "eZeeKonfigurator_client";
      rev = "efbe39bb1e40a0332d37c3291ee3c8af1ff7678e";
      fetchSubmodules = false;
      sha256 = "sha256-b2QqmduoyohAIOJnZP/Vnt9FdmoOebDfmaTs5SNVoAg=";
    };
  };
  elastalert2 = {
    pname = "elastalert2";
    version = "478eb6e9be25b330e4db7e7f56e45ab97f637294";
    src = fetchFromGitHub {
      owner = "jertel";
      repo = "elastalert2";
      rev = "478eb6e9be25b330e4db7e7f56e45ab97f637294";
      fetchSubmodules = false;
      sha256 = "sha256-tlPmnm9kEiLfDUL6Ms+Wnuu5ia1KZq0WebFWTcN/6zQ=";
    };
  };
  fastai = {
    pname = "fastai";
    version = "7f1a430f152775bbbdfa6c1a8f6a466f72d822fa";
    src = fetchFromGitHub {
      owner = "fastai";
      repo = "fastai";
      rev = "7f1a430f152775bbbdfa6c1a8f6a466f72d822fa";
      fetchSubmodules = false;
      sha256 = "sha256-IMTYwCleaL0a8xg1F8qwh1tIpuP4z8HCwINdtg0GSQE=";
    };
  };
  fastcore = {
    pname = "fastcore";
    version = "2a0bbdf0481cddeacf28ef60712bc05be8346caf";
    src = fetchFromGitHub {
      owner = "fastai";
      repo = "fastcore";
      rev = "2a0bbdf0481cddeacf28ef60712bc05be8346caf";
      fetchSubmodules = false;
      sha256 = "sha256-c7e/IAzPPGsOyqB+dV0uaD2Q+Aw6PJ3uiGySxJTCEZU=";
    };
  };
  fastprogress = {
    pname = "fastprogress";
    version = "1.0.2";
    src = fetchurl {
      url = "https://pypi.io/packages/source/f/fastprogress/fastprogress-1.0.2.tar.gz";
      sha256 = "sha256-lga6RCUFo6RFgdY97dzlv/HfF6y9w3JS98PxvlLB0kM=";
    };
  };
  ghq = {
    pname = "ghq";
    version = "8f948f2d8b69cd346afc6331f58e673230df5b5e";
    src = fetchFromGitHub {
      owner = "x-motemen";
      repo = "ghq";
      rev = "8f948f2d8b69cd346afc6331f58e673230df5b5e";
      fetchSubmodules = false;
      sha256 = "sha256-jxqTM4nn5PpIDkCttRI6WzJ5eAhuM8Z2fIBsO6IJ2YA=";
    };
  };
  go-nfsd = {
    pname = "go-nfsd";
    version = "a019f4d17fe0c5d02404788dbef39bc9f885e521";
    src = fetchFromGitHub {
      owner = "mit-pdos";
      repo = "go-nfsd";
      rev = "a019f4d17fe0c5d02404788dbef39bc9f885e521";
      fetchSubmodules = false;
      sha256 = "sha256-+bcRGlJhQSWPLVgSmAbP0Kh6mqCgmnZZksmQV7cVG3g=";
    };
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
  };
  nix-unstable-installer = {
    pname = "nix-unstable-installer";
    version = "nix-2.9.0pre20220519_5aeda91";
    src = fetchurl {
      url = "https://github.com/numtide/nix-unstable-installer/releases/download/nix-2.9.0pre20220519_5aeda91/install";
      sha256 = "sha256-+mQ3zEl+NmmJ89Xi6co9jRmlYWF7NnWKWcUTQR0D4LQ=";
    };
  };
  nvdtools = {
    pname = "nvdtools";
    version = "22daa55f30c8aa6a78565cc6b4c160c41b867636";
    src = fetchFromGitHub {
      owner = "facebookincubator";
      repo = "nvdtools";
      rev = "22daa55f30c8aa6a78565cc6b4c160c41b867636";
      fetchSubmodules = false;
      sha256 = "sha256-uB7dfqGaoP9Xx04BykscIFQ2rckaMaj93gh5mhgMqfw=";
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
  py-tree-sitter = {
    pname = "py-tree-sitter";
    version = "7dc704fa37057c685fe2d86611f318146c95c34d";
    src = fetchFromGitHub {
      owner = "tree-sitter";
      repo = "py-tree-sitter";
      rev = "7dc704fa37057c685fe2d86611f318146c95c34d";
      fetchSubmodules = true;
      sha256 = "sha256-fjol52OEWNC+fXqbZ9EoQuJw1Ns+MafpUjpTkze1n1k=";
    };
  };
  sybilhunter = {
    pname = "sybilhunter";
    version = "2f0a8f09308f7de51ce1095353f4af82a8a15f88";
    src = fetchFromGitHub {
      owner = "NullHypothesis";
      repo = "sybilhunter";
      rev = "2f0a8f09308f7de51ce1095353f4af82a8a15f88";
      fetchSubmodules = false;
      sha256 = "sha256-vIOibQuMauVhkxgR9QaL+pbocY7xgyamMeOhtKmye70=";
    };
  };
  tc-redirect-tap = {
    pname = "tc-redirect-tap";
    version = "c02cef088b3b7f8d2c65271aace7b3de076294e3";
    src = fetchFromGitHub {
      owner = "awslabs";
      repo = "tc-redirect-tap";
      rev = "c02cef088b3b7f8d2c65271aace7b3de076294e3";
      fetchSubmodules = false;
      sha256 = "sha256-sGYxO/LxkyazANOdBLEsCLb5y/9K8PNAWkmxGKWa6CE=";
    };
  };
  vailyn = {
    pname = "vailyn";
    version = "v3.3.2-1";
    src = fetchFromGitHub {
      owner = "VainlyStrain";
      repo = "Vailyn";
      rev = "v3.3.2-1";
      fetchSubmodules = false;
      sha256 = "sha256-eHnqfL6Nt0FDyIoZ4RhwB29h3r6ctVQKAGCeZkOk5yo=";
    };
  };
  vault-cli = {
    pname = "vault-cli";
    version = "0142476bcfda52876951f49b0990ac1d85377d3a";
    src = fetchFromGitHub {
      owner = "peopledoc";
      repo = "vault-cli";
      rev = "0142476bcfda52876951f49b0990ac1d85377d3a";
      fetchSubmodules = false;
      sha256 = "sha256-/YNBI1IknygmqKy5JMCS63AX581YY5wqE1KN75rBPH0=";
    };
  };
  zat = {
    pname = "zat";
    version = "fed88c4310cf70c8b01c9a7eb0918b8c4d117e77";
    src = fetchFromGitHub {
      owner = "SuperCowPowers";
      repo = "zat";
      rev = "fed88c4310cf70c8b01c9a7eb0918b8c4d117e77";
      fetchSubmodules = false;
      sha256 = "sha256-8uydkQkD5M4jFCmMLNkJDdFILYLzvJuLFfbNPLNHmHE=";
    };
  };
  zed = {
    pname = "zed";
    version = "50469a01b067cfcb9fdb657498a40bb8058808fe";
    src = fetchFromGitHub {
      owner = "brimdata";
      repo = "zed";
      rev = "50469a01b067cfcb9fdb657498a40bb8058808fe";
      fetchSubmodules = false;
      sha256 = "sha256-Oh8d2Zi3rF/Nfr909XdeCa74pSVNuXiottHRP3Tbetw=";
    };
  };
  zeekscript = {
    pname = "zeekscript";
    version = "22ecc621a6a6a9b93b3b61eb8b97b39ac0969ab6";
    src = fetchFromGitHub {
      owner = "zeek";
      repo = "zeekscript";
      rev = "22ecc621a6a6a9b93b3b61eb8b97b39ac0969ab6";
      fetchSubmodules = true;
      sha256 = "sha256-zi9lPcdSQtniHod9Fjb5j5a59xTZJH2JjouYpETH0rY=";
    };
  };
}
