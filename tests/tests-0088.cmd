# edns=0 IPv6 TCP
/usr/local/bin/dig +edns=0 +nocookie +noad @l.root-servers.net SOA . +dnssec +norec +time=2 +tries=1 +noignore +yaml -6 +tcp
