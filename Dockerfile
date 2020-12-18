FROM dotriver/alpine-s6

RUN apk --no-cache add nginx \
    && mkdir -p /run/nginx/ \
    && rm -R /var/www/* || true \
    && chown nginx:nginx /var/www/ /run/nginx/ \
    && rm /etc/nginx/conf.d/* \
    && sed -i '3i\ \ \ \ application/wasm wasm\;' /etc/nginx/mime.types

RUN L=$(curl -s https://api.github.com/repos/vector-im/element-web/releases/latest | egrep "https.*tar.gz" | cut -d '"' -f4 | head -1) \
    && wget $L -O /tmp/element.tar.gz \
    && cd /tmp/ \
    && tar -xzf /tmp/element.tar.gz \
    && rm /tmp/element.tar.gz \
    && mv /tmp/element-*/ /var/www/element


ADD conf/ /

RUN set -x \
    && chmod +x /etc/s6/services/*/*