#! /bin/sh

if [ ! -e "/etc/mozilla/ssl/certificate.pem" ]
then
    echo "Generating self-signed TLS certificates"
    mkdir -p /etc/mozilla/ssl
    pushd /etc/mozilla/ssl
    openssl genrsa -out privatekey.pem 2048
    openssl req -new -subj '/CN=*/' -sha256 -key privatekey.pem -out csr.pem
    openssl x509 -req -in csr.pem -signkey privatekey.pem -out certificate.pem
fi

exec $@
