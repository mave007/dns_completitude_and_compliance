# EDNS without cookie, and subnet IPv4 TCP
/usr/local/bin/dig +edns=0 +nocookie +noad +subnet=0.0.0.0/0 +expire @ns.cero32.cl SOA . +norec +time=1 +tries=1 +noignore +yaml -4 +tcp
