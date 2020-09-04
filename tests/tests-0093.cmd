# edns=0 with buffer 512b IPv4 UDP
/usr/local/bin/dig +edns=0 +nocookie +noad +dnssec +ignore +bufsize=512 DNSKEY @l.root-servers.net . +dnssec +norec +time=2 +tries=1 +noignore +yaml -4 +notcp
