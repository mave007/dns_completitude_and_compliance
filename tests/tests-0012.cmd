# NS record answer IPv6 TCP
/usr/local/bin/dig . NS @l.root-servers.net +dnssec +norec +time=2 +tries=1 +noignore +yaml -6 +tcp
