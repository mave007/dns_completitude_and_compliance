# TCP query only IPv4 TCP
/usr/local/bin/dig +noedns +noad +tcp @l.root-servers.net SOA . +dnssec +norec +time=2 +tries=1 +noignore +yaml -4 +tcp
