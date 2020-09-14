# No EDNS, no DNSSEC, Authoritative bit IPv4 UDP
/usr/local/bin/dig +noedns +noad +aaflag SOA . @ns.cero32.cl +norec +time=1 +tries=1 +noignore +yaml  -4 +notcp
