# No EDNS and no DNSSEC IPv4 TCP
/usr/local/bin/dig +noedns +noad SOA . @ns.cero32.cl +norec +time=1 +tries=1 +noignore +yaml  -4 +tcp
