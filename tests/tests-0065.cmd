# zflag (last unassigned DNS header flag) IPv4 UDP
/usr/local/bin/dig +noedns +noad +zflag SOA . @l.root-servers.net +dnssec +norec +time=2 +tries=1 +noignore +yaml  -4 +notcp
