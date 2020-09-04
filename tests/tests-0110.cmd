# Known NS record IPv4 TCP
/usr/local/bin/dig +edns=0 +nocookie +noad +dnssec +cd @l.root-servers.net SOA . +dnssec +norec +time=2 +tries=1 +noignore +yaml -4 +tcp
