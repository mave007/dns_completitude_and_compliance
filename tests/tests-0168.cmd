# edns=1 with expire IPv6 TCP
/usr/local/bin/dig +edns=1 +noednsneg +nocookie +noad +expire @ns.cero32.cl SOA . +norec +time=1 +tries=1 +noignore +yaml -6 +tcp
