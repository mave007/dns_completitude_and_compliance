# Set edns cookie IPv4 UDP
/usr/local/bin/dig +edns=0 +noad +cookie=0102030405060708 @l.root-servers.net SOA . +dnssec +norec +time=2 +tries=1 +noignore +yaml -4 +notcp
