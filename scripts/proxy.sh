echo "nameserver ::1\nnameserver 127.0.0.1\noptions edns0" > /etc/resolv.conf
systemctl start dnscrypt-proxy
