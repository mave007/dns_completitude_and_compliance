# Truncation bit IPv4 TCP
/usr/local/bin/dig +noedns +noad +tcflag SOA . @l.root-servers.net +dnssec +norec +time=2 +tries=1 +noignore +yaml  -4 +tcp
