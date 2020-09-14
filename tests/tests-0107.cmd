# edns=1 IPv6 UDP
/usr/local/bin/dig +edns=1 +noednsneg +nocookie +noad @ns.cero32.cl SOA . +norec +time=1 +tries=1 +noignore +yaml +dnssec -6 +notcp
