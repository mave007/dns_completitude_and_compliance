# Recursion disable flag IPv4 UDP
/usr/local/bin/dig +noedns +noad SOA . @l.root-servers.net +dnssec +rec +time=2 +tries=1 +noignore +yaml  -4 +notcp
