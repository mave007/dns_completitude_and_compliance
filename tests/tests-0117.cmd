# edns=1 with unknown option 100 IPv4 UDP
/usr/local/bin/dig +edns=1 +noednsneg +nocookie +noad +ednsopt=100 @ns.cero32.cl SOA . +norec +time=1 +tries=1 +noignore +yaml +dnssec -4 +notcp
