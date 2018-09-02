FROM nginx:alpine

MAINTAINER khiraiwa <the.world.nova@gmail.com>

COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY default.conf /etc/nginx/conf.d/default.conf
# COPY hoge /hoge

RUN apk --no-cache add python2 py2-pip && \
  pip --no-cache-dir install awscli && \
  apk --purge del py-pip && \
  rm -rf /var/cache/apk/*

ENV NGINX_PROXY_PASS_HOST="localhost" \
  NGINX_PROXY_PASS_PORT="80" \
  NGINX_PORT="80"

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD ["nginx"]
