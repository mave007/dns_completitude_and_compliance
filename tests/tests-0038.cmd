# No EDNS and no DNSSEC IPv4 TCP
/usr/local/bin/dig +noedns +noad SOA . @l.root-servers.net +dnssec +norec +time=2 +tries=1 +noignore +yaml  -4 +tcp
