# No EDNS, DNSSEC, Checking disable bit IPv4 TCP
/usr/local/bin/dig +noedns +ad +cd SOA . @ns.cero32.cl +norec +time=1 +tries=1 +noignore +yaml +dnssec  -4 +tcp
