# edns=1 with subnet IPv6 UDP
/usr/local/bin/dig +edns=1 +noednsneg +nocookie +noad +subnet=0.0.0.0/0 @ns.cero32.cl SOA . +norec +time=1 +tries=1 +noignore +yaml -6 +notcp
