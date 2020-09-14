# Set expiration without cookie IPv6 UDP
/usr/local/bin/dig +edns=0 +nocookie +noad +expire @ns.cero32.cl SOA . +norec +time=1 +tries=1 +noignore +yaml -6 +notcp
