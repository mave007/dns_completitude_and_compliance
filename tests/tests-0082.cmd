# zflag (last unassigned DNS header flag) IPv4 TCP
/usr/local/bin/dig +noedns +noad +zflag SOA . @ns.cero32.cl +norec +time=1 +tries=1 +noignore +yaml +dnssec  -4 +tcp
