if [ ! -f /etc/nginx/dhparam.pem ]; then
openssl dhparam -dsaparam -out /etc/nginx/dhparam.pem 2048
fi
nginx -g "daemon off;"
