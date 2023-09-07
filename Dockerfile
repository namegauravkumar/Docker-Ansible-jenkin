FROM ubuntu:22.04

RUN apt update -y
RUN apt upgrade -y
RUN apt install systemctl -y
RUN apt install -y nginx \
        zip \
unzip
RUN systemctl start nginx
RUN systemctl enable nginx
ADD https://www.free-css.com/assets/files/free-css-templates/download/page295/handtime.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip handtime.zip
RUN cp -rvf handtime-html/* .
RUN rm -rf handtime.zip
RUN systemctl restart nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
