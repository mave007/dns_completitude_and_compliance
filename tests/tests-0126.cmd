# Known NS record IPv4 TCP
/usr/local/bin/dig +edns=0 +nocookie +noad +dnssec +cd @ns.cero32.cl SOA . +norec +time=1 +tries=1 +noignore +yaml -4 +tcp
