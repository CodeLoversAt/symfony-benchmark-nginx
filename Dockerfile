FROM nginx

MAINTAINER Daniel Holzmann <daniel@codelovers.at>

ADD conf/common.conf /etc/nginx/common.conf
ADD conf/fastcgi_params /etc/nginx/fastcgi_params
ADD conf/nginx.conf /etc/nginx/nginx.conf
ADD conf/hhvm.conf /etc/nginx/hhvm.conf
ADD conf/php54.conf /etc/nginx/php54.conf
ADD conf/php55.conf /etc/nginx/php55.conf

# server configs
RUN rm -f /etc/nginx/conf.d/*
ADD conf/server-hhvm.conf /etc/nginx/conf.d/server-hhvm.conf
ADD conf/server-php54.conf /etc/nginx/conf.d/server-php54.conf
ADD conf/server-php55.conf /etc/nginx/conf.d/server-php55.conf

EXPOSE 8080
EXPOSE 8081
EXPOSE 8082
