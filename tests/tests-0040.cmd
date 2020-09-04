# No EDNS and no DNSSEC IPv6 TCP
/usr/local/bin/dig +noedns +noad SOA . @l.root-servers.net +dnssec +norec +time=2 +tries=1 +noignore +yaml  -6 +tcp
