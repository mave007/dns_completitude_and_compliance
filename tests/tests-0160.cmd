# edns-0 and TCP IPv6 TCP
/usr/local/bin/dig +edns=0 +nocookie +noad +dnssec +bufsize=512 +tcp DNSKEY @l.root-servers.net . +dnssec +norec +time=2 +tries=1 +noignore +yaml -6 +tcp
