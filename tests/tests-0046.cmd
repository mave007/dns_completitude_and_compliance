# No EDNS, DNSSEC, Checking disable bit IPv4 TCP
/usr/local/bin/dig +noedns +ad +cd SOA . @l.root-servers.net +dnssec +norec +time=2 +tries=1 +noignore +yaml  -4 +tcp
