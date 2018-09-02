#!/bin/sh

set -eo pipefail

aws s3 cp s3://${S3_BACKET_NAME}/${S3_KEY} /hoge

sed -i -e "s/NGINX_PROXY_PASS_HOST/${NGINX_PROXY_PASS_HOST}/g" /etc/nginx/conf.d/default.conf
sed -i -e "s/NGINX_PROXY_PASS_PORT/${NGINX_PROXY_PASS_PORT}/g" /etc/nginx/conf.d/default.conf
sed -i -e "s/NGINX_PORT/${NGINX_PORT}/g" /etc/nginx/conf.d/default.conf


case "$1" in
    nginx)
        nginx -g "daemon off;"
        exit 0
        ;;

    help)
        echo "nothing."
        exit 0
        ;;
esac

exec "$@"
