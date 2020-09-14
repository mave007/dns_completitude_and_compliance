# Recursion available flags IPv4 TCP
/usr/local/bin/dig +noedns +noad +cd +raflag SOA . @ns.cero32.cl +norec +time=1 +tries=1 +noignore +yaml +dnssec  -4 +tcp
