# edns=1 IPv4 UDP
/usr/local/bin/dig +edns=1 +noednsneg +nocookie +noad @l.root-servers.net SOA . +dnssec +norec +time=2 +tries=1 +noignore +yaml -4 +notcp
