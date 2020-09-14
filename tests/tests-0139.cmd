# Set cookie with expiration IPv6 UDP
/usr/local/bin/dig +edns=0 +noad +nsid +subnet=0.0.0.0/0 +expire +cookie=0102030405060708 @ns.cero32.cl SOA . +norec +time=1 +tries=1 +noignore +yaml -6 +notcp
