# edns=1 NSID IPv6 UDP
/usr/local/bin/dig +edns=1 +noednsneg +nocookie +noad +nsid @ns.cero32.cl SOA . +norec +time=1 +tries=1 +noignore +yaml -6 +notcp
