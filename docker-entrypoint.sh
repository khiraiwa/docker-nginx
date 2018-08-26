#!/bin/sh

set -eo pipefail

aws s3 cp s3://${S3_BACKET_NAME}/${S3_KEY} /hoge

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
