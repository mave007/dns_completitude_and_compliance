# Recursion disable flag IPv6 TCP
/usr/local/bin/dig +noedns +noad SOA . @ns.cero32.cl +rec +time=1 +tries=1 +noignore +yaml  -6 +tcp
