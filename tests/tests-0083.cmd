# TCP query only IPv6 UDP
/usr/local/bin/dig +noedns +noad +tcp @l.root-servers.net SOA . +dnssec +norec +time=2 +tries=1 +noignore +yaml -6 +notcp
