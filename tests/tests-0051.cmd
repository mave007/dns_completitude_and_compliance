# No EDNS, No DNSSEC, Checking disable bit IPv6 UDP
/usr/local/bin/dig +noedns +noad +cd SOA . @l.root-servers.net +dnssec +norec +time=2 +tries=1 +noignore +yaml  -6 +notcp
