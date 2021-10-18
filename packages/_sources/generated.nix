# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl }:
{
  brim = {
    pname = "brim";
    version = "0.26.0";
    src = fetchurl {
      url = "https://github.com/brimdata/brim/releases/download/v0.26.0/Brim-0.26.0.deb";
      sha256 = "15srxv0lylgp4qalar2c2wp8mjy9pnws6ylfyhsk478ajlk67603";
    };
  };
  broker = {
    pname = "broker";
    version = "47cac80cbe1e1bde8e3b425903e50d62715972a2";
    src = fetchgit {
      url = "https://github.com/zeek/broker";
      rev = "47cac80cbe1e1bde8e3b425903e50d62715972a2";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1h7afsfqhm7zyr3qqvwxmv71izxgdpa60r4kjx4hc7m0rvpbwy83";
    };
  };
  broker-to-json = {
    pname = "broker-to-json";
    version = "v_02";
    src = fetchgit {
      url = "https://github.com/grigorescu/broker-to-json";
      rev = "v_02";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1n0jklz0lhdkr29rjkhj9swmndvk152w5m90wdj2rrlg3lhrq4s9";
    };
  };
  btest = {
    pname = "btest";
    version = "0.68";
    src = fetchurl {
      url = "https://pypi.io/packages/source/b/btest/btest-0.68.tar.gz";
      sha256 = "00nxf7rh38hrzjq4v70idbrjsgxd5nh97cj0k4qw4z0yl2l2s553";
    };
  };
  choochoo = {
    pname = "choochoo";
    version = "29750cdb9f87dc7a4b6e423df6e805e14ecae5e1";
    src = fetchgit {
      url = "https://github.com/andrewcooke/choochoo";
      rev = "29750cdb9f87dc7a4b6e423df6e805e14ecae5e1";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "16aw0sg36mbs9pds5bb0w7hx3z25hlwkvzzdlvqq5831bdixzy7w";
    };
  };
  clx = {
    pname = "clx";
    version = "c95bc791439e4ef4abf5771f06c5573722a5c516";
    src = fetchgit {
      url = "https://github.com/rapidsai/clx";
      rev = "c95bc791439e4ef4abf5771f06c5573722a5c516";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0l9y30cfz1i394a7kbqdsf17q8ia7fffiz9nwjan28qiimnvq8ah";
    };
  };
  cnmem = {
    pname = "cnmem";
    version = "37896cc9bfc6536a8c878a1e675835c22d827821";
    src = fetchgit {
      url = "https://github.com/NVIDIA/cnmem";
      rev = "37896cc9bfc6536a8c878a1e675835c22d827821";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0wx25vn9dq0wwp1klx862cavsgf0f2b5m0sc1d2jr121v24z96jy";
    };
  };
  cudf = {
    pname = "cudf";
    version = "74763ba9999ce52a83e5254da986c75c03f4d0d5";
    src = fetchgit {
      url = "https://github.com/rapidsai/cudf";
      rev = "74763ba9999ce52a83e5254da986c75c03f4d0d5";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0sv7y3pkdkbc0zzi8bn380390rzkd8p566klcrlisc6pdbacfla2";
    };
  };
  durationpy = {
    pname = "durationpy";
    version = "0.5";
    src = fetchurl {
      url = "https://pypi.io/packages/source/d/durationpy/durationpy-0.5.tar.gz";
      sha256 = "022l9cqv648rxmavi1rgp2724jaynz7vwma6ycidfl3va9ml3yay";
    };
  };
  eZeeKonfigurator = {
    pname = "eZeeKonfigurator";
    version = "51bb45163e90a1d328a3fb3f44f95b8801e70687";
    src = fetchgit {
      url = "https://github.com/esnet/eZeeKonfigurator";
      rev = "51bb45163e90a1d328a3fb3f44f95b8801e70687";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "029k2m18j3ilhzaynf4c91vldm908i4725wmabl8x3vik73kc1h2";
    };
  };
  eZeeKonfigurator_client = {
    pname = "eZeeKonfigurator_client";
    version = "efbe39bb1e40a0332d37c3291ee3c8af1ff7678e";
    src = fetchgit {
      url = "https://github.com/esnet/eZeeKonfigurator_client";
      rev = "efbe39bb1e40a0332d37c3291ee3c8af1ff7678e";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0250aliybv54k7gv0y8fd9v4bpwyspzn8rz24108ijm8vfcjlr3g";
    };
  };
  elastalert2 = {
    pname = "elastalert2";
    version = "8f54de112b539111622c3af6f471de4d78be802e";
    src = fetchgit {
      url = "https://github.com/jertel/elastalert2";
      rev = "8f54de112b539111622c3af6f471de4d78be802e";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "14j3d2bzfjv6pvpd73q7kd8j0xgp7q7vf20l9wa9rd86bz3r3spn";
    };
  };
  fastai = {
    pname = "fastai";
    version = "bf9f0d5b8bd977808826581df03a9e3d65ba18cc";
    src = fetchgit {
      url = "https://github.com/fastai/fastai";
      rev = "bf9f0d5b8bd977808826581df03a9e3d65ba18cc";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1imqd9vsvngyg6s4gzdvpknp8qkz395854pv9ifhrawigg7b2xjz";
    };
  };
  fastcore = {
    pname = "fastcore";
    version = "7728f7e12ad90b13fe3e82645876b521ca9d2e5a";
    src = fetchgit {
      url = "https://github.com/fastai/fastcore";
      rev = "7728f7e12ad90b13fe3e82645876b521ca9d2e5a";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0ajd45b4yhdfx3nxjjwjrpv0210gd5vbkxg3q4zrfsf3akjya7fc";
    };
  };
  fastprogress = {
    pname = "fastprogress";
    version = "1.0.0";
    src = fetchurl {
      url = "https://pypi.io/packages/source/f/fastprogress/fastprogress-1.0.0.tar.gz";
      sha256 = "1zhv37q6jkqd1pfhlkd4yzrc3dg83vyksgzf32mjlhd5sb0qmql9";
    };
  };
  ghq = {
    pname = "ghq";
    version = "c875403c25e268945946e2926698fb23097e56f4";
    src = fetchgit {
      url = "https://github.com/x-motemen/ghq";
      rev = "c875403c25e268945946e2926698fb23097e56f4";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1fa540x43jn3anckrjjlqvvd9pgk23ac7g30w0qig7kffcr0myal";
    };
  };
  go-nfsd = {
    pname = "go-nfsd";
    version = "bb1dc61f5ca3f77c93164a94023548ff2fa5ec07";
    src = fetchgit {
      url = "https://github.com/mit-pdos/go-nfsd";
      rev = "bb1dc61f5ca3f77c93164a94023548ff2fa5ec07";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1cp8nx72qcnis1k1lk5zh189qdlpsndg3lmm49mznx9fsj77qz2p";
    };
  };
  gst = {
    pname = "gst";
    version = "fdab2f198de5873440a6014df4eb2eaa2d7f2ba0";
    src = fetchgit {
      url = "https://github.com/uetchy/gst";
      rev = "fdab2f198de5873440a6014df4eb2eaa2d7f2ba0";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1ji3sq2nmcv2j0phpsajcz6a7nz0kv8isnmazyjk9kl0hy7yjxba";
    };
  };
  nvdtools = {
    pname = "nvdtools";
    version = "e3af1166b05d4773b7aa4eb83e0ccd93e928eb3a";
    src = fetchgit {
      url = "https://github.com/facebookincubator/nvdtools";
      rev = "e3af1166b05d4773b7aa4eb83e0ccd93e928eb3a";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0k02v1fjg5g53jyqv00lybl8kfkfgkbxyc2jmm2675cbbzjjhx8h";
    };
  };
  osquery = {
    pname = "osquery";
    version = "5.0.1";
    src = fetchurl {
      url = "https://github.com/osquery/osquery/releases/download/5.0.1/osquery_5.0.1-1.linux_amd64.deb";
      sha256 = "1d0mrf8sfh0xpjf0x4vrq089vmrl8nqq6vl12i3c4mfr69h1hg6r";
    };
  };
  rmm = {
    pname = "rmm";
    version = "c781527db4ec62168ca483febf2c1dcc15e16aa2";
    src = fetchgit {
      url = "https://github.com/rapidsai/rmm";
      rev = "c781527db4ec62168ca483febf2c1dcc15e16aa2";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "105ripa7gak8vdg19dsgxrg0yl549431g4wpzkd4pmyz7nkkah17";
    };
  };
  sybilhunter = {
    pname = "sybilhunter";
    version = "2f0a8f09308f7de51ce1095353f4af82a8a15f88";
    src = fetchgit {
      url = "https://github.com/NullHypothesis/sybilhunter";
      rev = "2f0a8f09308f7de51ce1095353f4af82a8a15f88";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1gbvnalv98g366k2d0ziirqyi5psic3ga48qjdhyaslc1dns50xw";
    };
  };
  zat = {
    pname = "zat";
    version = "7f0de8bb052e8c84ab9bd00f195514d957eac9ec";
    src = fetchgit {
      url = "https://github.com/SuperCowPowers/zat";
      rev = "7f0de8bb052e8c84ab9bd00f195514d957eac9ec";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1kiz79k9d9azfvykpwwq49awma6nfhp2249fg2nad550pp6l2z1c";
    };
  };
  zed = {
    pname = "zed";
    version = "39c22bc7e0e612d70637ce6750fdce285f023199";
    src = fetchgit {
      url = "https://github.com/brimdata/zed";
      rev = "39c22bc7e0e612d70637ce6750fdce285f023199";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "05lgyiwgj30isan8syar0pnsc4k3iw0dm8270qv9z7f6sr11dfa5";
    };
  };
}
