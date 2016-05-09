FROM ubuntu:14.10
MAINTAINER geminiblue "oliyo@oliyo.cn"
# update source
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install curl libcurl4-openssl-dev libpng-dev libjpeg-dev libfreetype6-dev libxml2-dev libpcre3-dev libmcrypt-dev
RUN cd /tmp
RUN curl -L 'http://192.168.0.32:10005/software/openresty-master.tar.gz'| tar zxvf
RUN cd openresty-master
RUN ./configure --prefix=/usr/local/openresty --with-luajit && make && make install
RUN /usr/local/openresty/nginx/sbin/nginx
EXPOSE 80
