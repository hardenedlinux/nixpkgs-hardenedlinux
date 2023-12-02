# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
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
    date = "2021-09-12";
  };
  cliche = {
    pname = "cliche";
    version = "3621191561579f93867417c14b6bc25583d00c0d";
    src = fetchFromGitHub {
      owner = "kootenpv";
      repo = "cliche";
      rev = "3621191561579f93867417c14b6bc25583d00c0d";
      fetchSubmodules = false;
      sha256 = "sha256-K/39gTrZrZ1Nsrv9zYQV7ID3r8V1LcAJeHUQbq8Eqo0=";
    };
    date = "2023-11-23";
  };
  durationpy = {
    pname = "durationpy";
    version = "0.5";
    src = fetchurl {
      url = "https://pypi.org/packages/source/d/durationpy/durationpy-0.5.tar.gz";
      sha256 = "sha256-XvlBa1J7UNci80ZVvs+3Xkkijrgvh7hV7RkRszFLVAg=";
    };
  };
  eZeeKonfigurator = {
    pname = "eZeeKonfigurator";
    version = "d4b0d2382be550e2af46aeaf0ac02aab9b694668";
    src = fetchFromGitHub {
      owner = "esnet";
      repo = "eZeeKonfigurator";
      rev = "d4b0d2382be550e2af46aeaf0ac02aab9b694668";
      fetchSubmodules = false;
      sha256 = "sha256-K7PLVVesjv27dhYyRaWItfnsh+p6FTMFOXVE576a01I=";
    };
    date = "2022-07-05";
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
    date = "2021-07-01";
  };
  elastalert2 = {
    pname = "elastalert2";
    version = "a47a8841dc91dcaa28545194003ec11fd2218f08";
    src = fetchFromGitHub {
      owner = "jertel";
      repo = "elastalert2";
      rev = "a47a8841dc91dcaa28545194003ec11fd2218f08";
      fetchSubmodules = false;
      sha256 = "sha256-RYuAel5ob2G2rYX6WKo4SCuoSiohGxvcLw6E3jO3tcY=";
    };
    date = "2023-11-30";
  };
  polars = {
    pname = "polars";
    version = "py-0.19.19";
    src = fetchFromGitHub {
      owner = "pola-rs";
      repo = "polars";
      rev = "py-0.19.19";
      fetchSubmodules = false;
      sha256 = "sha256-uT228XgmSEBfCFbkYEOvrjDt1Xv6e4coz9/SjgA2Tjg=";
    };
  };
  sh = {
    pname = "sh";
    version = "2.0.6";
    src = fetchurl {
      url = "https://pypi.org/packages/source/s/sh/sh-2.0.6.tar.gz";
      sha256 = "sha256-mymY8xPyAcd34sAGHwsTZ0lwl+8TOIWVvhR+KgC/e6E=";
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
    date = "2019-03-26";
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
    date = "2022-01-27";
  };
}
