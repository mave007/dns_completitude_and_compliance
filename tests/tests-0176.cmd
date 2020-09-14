# edns-0 and TCP IPv6 TCP
/usr/local/bin/dig +edns=0 +nocookie +noad +dnssec +bufsize=512 +tcp DNSKEY @ns.cero32.cl . +norec +time=1 +tries=1 +noignore +yaml -6 +tcp
