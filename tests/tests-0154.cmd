# edns=1 with subnet IPv4 TCP
/usr/local/bin/dig +edns=1 +noednsneg +nocookie +noad +subnet=0.0.0.0/0 @l.root-servers.net SOA . +dnssec +norec +time=2 +tries=1 +noignore +yaml -4 +tcp
