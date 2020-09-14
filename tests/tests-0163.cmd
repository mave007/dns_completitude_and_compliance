# edns=1 with cookie IPv6 UDP
/usr/local/bin/dig +edns=1 +noednsneg +noad +cookie=0102030405060708 @ns.cero32.cl SOA . +norec +time=1 +tries=1 +noignore +yaml -6 +notcp
