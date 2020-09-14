# No EDNS, No DNSSEC, Checking disable bit IPv6 TCP
/usr/local/bin/dig +noedns +noad +cd SOA . @ns.cero32.cl +norec +time=1 +tries=1 +noignore +yaml  -6 +tcp
