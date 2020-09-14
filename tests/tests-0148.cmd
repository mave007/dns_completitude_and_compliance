# Set edns cookie IPv6 TCP
/usr/local/bin/dig +edns=0 +noad +cookie=0102030405060708 @ns.cero32.cl SOA . +norec +time=1 +tries=1 +noignore +yaml -6 +tcp
