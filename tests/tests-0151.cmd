# edns=1 with expire IPv6 UDP
/usr/local/bin/dig +edns=1 +noednsneg +nocookie +noad +expire @l.root-servers.net SOA . +dnssec +norec +time=2 +tries=1 +noignore +yaml -6 +notcp
