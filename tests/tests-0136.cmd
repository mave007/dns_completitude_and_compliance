# Disable edns negotiation and set custom flags IPv6 TCP
/usr/local/bin/dig +edns=0 +nocookie +noad +ednsflags=0x0080 @ns.cero32.cl SOA . +norec +time=1 +tries=1 +noignore +yaml +dnssec -6 +tcp
