# edns=1 with cookie IPv4 TCP
/usr/local/bin/dig +edns=1 +noednsneg +noad +cookie=0102030405060708 @l.root-servers.net SOA . +dnssec +norec +time=2 +tries=1 +noignore +yaml -4 +tcp
