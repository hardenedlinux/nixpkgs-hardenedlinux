# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl }:
{
  brim = {
    pname = "brim";
    version = "v0.24.0";
    src = fetchurl {
      url = "https://github.com/brimdata/brim/releases/download/v0.24.0/brim_amd64.deb";
      sha256 = "1sj23gdcqyl9rkfr5dvr3bkswzcc0kyjlfv8633zal3h2dsb2xpl";
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
    version = "015dd3e3960b6283d897f74b4c7a602e0732761f";
    src = fetchgit {
      url = "https://github.com/andrewcooke/choochoo";
      rev = "015dd3e3960b6283d897f74b4c7a602e0732761f";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1qzd7rv661hkic2jk01zfmlv5xc57cn9b5606pf6ip7r46zhjhld";
    };
  };
  clx = {
    pname = "clx";
    version = "2d884b86d98d2821aab416d29665a35cc993c5a7";
    src = fetchgit {
      url = "https://github.com/rapidsai/clx";
      rev = "2d884b86d98d2821aab416d29665a35cc993c5a7";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0ymmwa9x7dcgwbyyrrgallb1hd0s9z47r7m3ama4d2fzmpzhpkra";
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
    version = "91f853395475b6a89a44aaf3b08224c66e109166";
    src = fetchgit {
      url = "https://github.com/rapidsai/cudf";
      rev = "91f853395475b6a89a44aaf3b08224c66e109166";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "18grrn5zr414038m9yclygs54ml4s9gzbwhgw9mq8vi6n650qh3h";
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
    version = "57c6faece572dbb7e4f45dc1e9c43952f1c392f0";
    src = fetchgit {
      url = "https://github.com/esnet/eZeeKonfigurator";
      rev = "57c6faece572dbb7e4f45dc1e9c43952f1c392f0";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1vg2mmjwrnkird6w25phjgi4hbzs5wy27a8hv10br7j5izrf112a";
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
    version = "0dbeaa19086baa8d62e137956a84500b3e7013ea";
    src = fetchgit {
      url = "https://github.com/jertel/elastalert2";
      rev = "0dbeaa19086baa8d62e137956a84500b3e7013ea";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1dfngrsxfkiy6dylz9pfjrw4hx3sbzcvaicxpzibyr32ncpd6j21";
    };
  };
  fastai = {
    pname = "fastai";
    version = "4b0785254fdece1a44859956b6e54eedb167a97e";
    src = fetchgit {
      url = "https://github.com/fastai/fastai";
      rev = "4b0785254fdece1a44859956b6e54eedb167a97e";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "19kmi5iicywivv91k2002axd6wb3cnk2iqgyf6vfckagzll7jd5v";
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
    version = "952d0696a19961ffb4bc18c415df62ea4d00d2fa";
    src = fetchgit {
      url = "https://github.com/facebookincubator/nvdtools";
      rev = "952d0696a19961ffb4bc18c415df62ea4d00d2fa";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "11cki0lhmjkh6cwbckgs0hy9qspgj7czxbv5w914d1k2r62a1wcc";
    };
  };
  rmm = {
    pname = "rmm";
    version = "8527317aa63efe37c9815b1419c893e666cbea56";
    src = fetchgit {
      url = "https://github.com/rapidsai/rmm";
      rev = "8527317aa63efe37c9815b1419c893e666cbea56";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "14q9n8yv0492xjfi3cqn7hwkj08a6qzzbrzx2yjgkpirzmqsi5x4";
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
    version = "2924f5a713bb0c42dedbb89e031acab05b558e10";
    src = fetchgit {
      url = "https://github.com/SuperCowPowers/zat";
      rev = "2924f5a713bb0c42dedbb89e031acab05b558e10";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1k7jv07dv80cxsq1v087zb3q9li9gzxjn74lmb93xfs8sqk6lh03";
    };
  };
  zed = {
    pname = "zed";
    version = "882418925884e7b2cd43425b8e95f0bd79df9705";
    src = fetchgit {
      url = "https://github.com/brimdata/zed";
      rev = "882418925884e7b2cd43425b8e95f0bd79df9705";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "01vfcn1868is7xsqhr75rfb9qs0flwmh5vsw703r0xfvqgrgj220";
    };
  };
}
