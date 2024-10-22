#!/bin/bash
key_file="/etc/ssl/certs/nginx.key"
crt_file="/etc/ssl/certs/nginx.cert"
if [ -e $key_file ] && [ -e $crt_file ]; then
	echo "CERT already created"
else
	openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout $key_file -out $crt_file -subj "/C=ES/ST=Barcelona/L=Barcelona/O=42/OU=Education/CN=nkeyani-.42.fr"
fi
exec "$@"
