# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
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
    version = "cc86923fd578d3f9182df6d1cac86a6e97b30259";
    src = fetchFromGitHub {
      owner = "Yidadaa";
      repo = "ChatGPT-Next-Web";
      rev = "cc86923fd578d3f9182df6d1cac86a6e97b30259";
      fetchSubmodules = false;
      sha256 = "sha256-djkuFWH9tk0Ml3TYobe3zTAq84nVzff0RqHoYoPQxk8=";
    };
    date = "2024-01-05";
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
  koodo-reader = {
    pname = "koodo-reader";
    version = "2bfebe65b20d86b3d954e8592600a2ca8865d28a";
    src = fetchFromGitHub {
      owner = "troyeguo";
      repo = "koodo-reader";
      rev = "2bfebe65b20d86b3d954e8592600a2ca8865d28a";
      fetchSubmodules = false;
      sha256 = "sha256-AkaAkuG+xB9pmClYqOinAWrlswsBU6SqxNdGFxevdkA=";
    };
    date = "2024-01-07";
  };
  nix-unstable-installer = {
    pname = "nix-unstable-installer";
    version = "nix-2.20.0pre20231220_75e10e4";
    src = fetchurl {
      url = "https://github.com/numtide/nix-unstable-installer/releases/download/nix-2.20.0pre20231220_75e10e4/install";
      sha256 = "sha256-ABuv3shsqDWGgLc8tBF4S3755ba3HkXCguAzEjcGq6E=";
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
  watchexec-simple = {
    pname = "watchexec-simple";
    version = "68eee93f60cf574403b1fc97b73e42cf8e6d92e9";
    src = fetchFromGitHub {
      owner = "kurtbuilds";
      repo = "watchexec-simple";
      rev = "68eee93f60cf574403b1fc97b73e42cf8e6d92e9";
      fetchSubmodules = false;
      sha256 = "sha256-lvC79sFODEfKeZ7bTMrQIUpWQ/zFw9JyLz2lymmdQ0M=";
    };
    date = "2023-10-24";
  };
  yakgpt = {
    pname = "yakgpt";
    version = "eac84e69a297ea344f9b2533601e2810d739307c";
    src = fetchFromGitHub {
      owner = "yakGPT";
      repo = "yakGPT";
      rev = "eac84e69a297ea344f9b2533601e2810d739307c";
      fetchSubmodules = false;
      sha256 = "sha256-IhxOFr/HCReJzlGLB2LmHJPZr7KVuqRsdyN/iUJ3q9U=";
    };
    date = "2023-11-26";
  };
  zeek-language-server = {
    pname = "zeek-language-server";
    version = "0c86af098e0f50f41f99f10f0970b689cfcaf9be";
    src = fetchFromGitHub {
      owner = "bbannier";
      repo = "zeek-language-server";
      rev = "0c86af098e0f50f41f99f10f0970b689cfcaf9be";
      fetchSubmodules = true;
      sha256 = "sha256-PlHtQs+wb7VjjFesj0xYEvrO9vc2W75XmRbpOLMR0RU=";
    };
    date = "2024-01-01";
  };
}
