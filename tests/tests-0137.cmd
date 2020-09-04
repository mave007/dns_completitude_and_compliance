# EDNS without cookie, and subnet IPv4 UDP
/usr/local/bin/dig +edns=0 +nocookie +noad +subnet=0.0.0.0/0 +expire @l.root-servers.net SOA . +dnssec +norec +time=2 +tries=1 +noignore +yaml -4 +notcp
