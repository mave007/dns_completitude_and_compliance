# No EDNS, no DNSSEC, Authoritative bit IPv4 UDP
/usr/local/bin/dig +noedns +noad +aaflag SOA . @l.root-servers.net +dnssec +norec +time=2 +tries=1 +noignore +yaml  -4 +notcp
