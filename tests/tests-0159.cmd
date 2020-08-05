/usr/local/bin/dig +edns=0 +nocookie +noad +dnssec +bufsize=512 +tcp DNSKEY @l.root-servers.net. . +dnssec +norec +time=2 +tries=1 +noignore +yaml -6 +notcp +bufsize=1220 +edns=0
