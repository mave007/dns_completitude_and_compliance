# Set expiration without cookie IPv6 UDP
/usr/local/bin/dig +edns=0 +nocookie +noad +expire @l.root-servers.net SOA . +dnssec +norec +time=2 +tries=1 +noignore +yaml -6 +notcp
