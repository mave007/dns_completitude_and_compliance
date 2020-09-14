# edns=0 with buffer 512b IPv6 UDP
/usr/local/bin/dig +edns=0 +nocookie +noad +dnssec +ignore +bufsize=512 DNSKEY @ns.cero32.cl . +norec +time=1 +tries=1 +noignore +yaml -6 +notcp
