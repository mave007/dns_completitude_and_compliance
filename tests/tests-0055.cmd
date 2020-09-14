# No EDNS and no DNSSEC IPv6 UDP
/usr/local/bin/dig +noedns +noad SOA . @ns.cero32.cl +norec +time=1 +tries=1 +noignore +yaml  -6 +notcp
