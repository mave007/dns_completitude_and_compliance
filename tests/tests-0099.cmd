# TCP query only IPv6 UDP
/usr/local/bin/dig +noedns +noad +tcp @ns.cero32.cl SOA . +norec +time=1 +tries=1 +noignore +yaml +dnssec -6 +notcp
