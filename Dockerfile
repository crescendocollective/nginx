FROM nginx:stable-alpine


RUN apk update
RUN apk upgrade
RUN apk update
RUN apk add acme-client libressl
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY acme-client /etc/periodic/daily/
COPY nginx.conf /etc/nginx/

EXPOSE 80
EXPOSE 443
EXPOSE 8082

COPY entrypoint.sh /usr/local/bin/
CMD entrypoint.sh

STOPSIGNAL SIGTERM