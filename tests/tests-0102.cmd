# edns=0 IPv4 TCP
/usr/local/bin/dig +edns=0 +nocookie +noad @ns.cero32.cl SOA . +norec +time=1 +tries=1 +noignore +yaml +dnssec -4 +tcp
