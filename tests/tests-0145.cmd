# Set edns cookie IPv4 UDP
/usr/local/bin/dig +edns=0 +noad +cookie=0102030405060708 @ns.cero32.cl SOA . +norec +time=1 +tries=1 +noignore +yaml -4 +notcp
