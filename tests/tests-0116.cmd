# Disable EDNS version negotiation IPv6 TCP
/usr/local/bin/dig +edns=1 +noednsneg +nocookie +noad +dnssec @l.root-servers.net SOA . +dnssec +norec +time=2 +tries=1 +noignore +yaml -6 +tcp
