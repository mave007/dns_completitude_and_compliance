# Disable EDNS version negotiation IPv4 TCP
/usr/local/bin/dig +edns=1 +noednsneg +nocookie +noad +dnssec @l.root-servers.net SOA . +dnssec +norec +time=2 +tries=1 +noignore +yaml -4 +tcp
