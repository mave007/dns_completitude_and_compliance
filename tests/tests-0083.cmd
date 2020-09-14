# zflag (last unassigned DNS header flag) IPv6 UDP
/usr/local/bin/dig +noedns +noad +zflag SOA . @ns.cero32.cl +norec +time=1 +tries=1 +noignore +yaml +dnssec  -6 +notcp
