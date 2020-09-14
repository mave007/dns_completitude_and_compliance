# No EDNS, DNSSEC, Checking disable bit IPv6 UDP
/usr/local/bin/dig +noedns +ad +cd SOA . @ns.cero32.cl +norec +time=1 +tries=1 +noignore +yaml +dnssec  -6 +notcp
