# Disable edns negotiation and set custom flags IPv6 UDP
/usr/local/bin/dig +edns=0 +nocookie +noad +ednsflags=0x0080 @l.root-servers.net SOA . +dnssec +norec +time=2 +tries=1 +noignore +yaml -6 +notcp
