# https://itoka.hatenadiary.com/entry/2022/03/04/004453
FROM nginx:latest

RUN rm -f /etc/nginx/conf.d/*

ADD ./nginx.conf /etc/nginx/nginx.conf

CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
