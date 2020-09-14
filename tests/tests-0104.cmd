# edns=0 IPv6 TCP
/usr/local/bin/dig +edns=0 +nocookie +noad @ns.cero32.cl SOA . +norec +time=1 +tries=1 +noignore +yaml +dnssec -6 +tcp
