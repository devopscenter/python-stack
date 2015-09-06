#!/bin/bash -e

sudo useradd uwsgi

sudo apt-fast -y install supervisor

pushd /tmp
wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.36.tar.bz2 && \
    tar -xvf pcre-8.36.tar.bz2
pushd pcre-8.36 
./configure && make -j 3 && sudo make install
popd

wget http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz && tar -xvf nginx-$NGINX_VERSION.tar.gz
pushd nginx-$NGINX_VERSION 
./configure --with-http_stub_status_module && make -j 3 && sudo make install
popd

sudo pip install uwsgi==$UWSGI_VERSION && \
    sudo mkdir -p /var/log/uwsgi && \
    sudo mkdir -p /var/run/uwsgi && \
    sudo chown -R uwsgi /var/run/uwsgi && \
    sudo chown -R uwsgi /var/log/uwsgi
