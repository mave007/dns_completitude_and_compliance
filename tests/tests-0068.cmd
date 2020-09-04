# zflag (last unassigned DNS header flag) IPv6 TCP
/usr/local/bin/dig +noedns +noad +zflag SOA . @l.root-servers.net +dnssec +norec +time=2 +tries=1 +noignore +yaml  -6 +tcp
