# DNSKEY record answer IPv6 UDP
/usr/local/bin/dig . DNSKEY @ns.cero32.cl +norec +time=1 +tries=1 +noignore +yaml +dnssec -6 +notcp
