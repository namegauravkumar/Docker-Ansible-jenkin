FROM centos:latest

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum -y install nginx  \
        zip \
unzip
RUN systemctl enable nginx
ADD https://www.free-css.com/assets/files/free-css-templates/download/page295/kider.zip /usr/share/nginx/html/
WORKDIR /usr/share/nginx/html
RUN unzip kider.zip
RUN cp -rvf preschool-website-template/* .
RUN rm -rf kider.zip
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
