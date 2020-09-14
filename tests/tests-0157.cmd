# edns=1 NSID IPv4 UDP
/usr/local/bin/dig +edns=1 +noednsneg +nocookie +noad +nsid @ns.cero32.cl SOA . +norec +time=1 +tries=1 +noignore +yaml -4 +notcp
