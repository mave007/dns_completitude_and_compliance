# DNSKEY record answer IPv4 UDP
/usr/local/bin/dig . DNSKEY @ns.cero32.cl +norec +time=1 +tries=1 +noignore +yaml +dnssec -4 +notcp
