# Ask for NSID IPv6 UDP
/usr/local/bin/dig +edns=0 +nocookie +noad +nsid @l.root-servers.net SOA . +dnssec +norec +time=2 +tries=1 +noignore +yaml -6 +notcp
