{
  gnustep,
  lib,
  gnumake,
  openssl,
  pkg-config,
  libevent,
  libpcap,
  sqlite,
  libnet,
  nixpkgs-hardenedlinux-sources,
}:
gnustep.gsmakeDerivation rec {
  inherit (nixpkgs-hardenedlinux-sources.sslproxy) pname version src;

  nativeBuildInputs = [
    openssl
    pkg-config
  ];

  LIBNET_BASE = libnet;

  PREFIX = "${placeholder "out"}";

  buildInputs = [
    libevent
    libpcap
    sqlite
  ];

  enableParallelBuilding = true;

  meta = with lib; {
    description = "Transparent SSL/TLS proxy for decrypting and diverting network traffic to other programs, such as UTM services, for deep SSL inspection";
    homepage = "https://github.com/sonertari/SSLproxy";
    license = licenses.bsd2;
    platforms = with platforms; unix;
  };
}
