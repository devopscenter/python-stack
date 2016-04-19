#!/bin/bash -ev
sudo apt-get -qq update && sudo apt-get -qq -y install python-software-properties software-properties-common && \
    sudo add-apt-repository "deb http://gb.archive.ubuntu.com/ubuntu $(lsb_release -sc) universe" && \
    sudo apt-get -qq update

sudo add-apt-repository -y ppa:saiarcot895/myppa && \
    sudo apt-get -qq update && \
    sudo DEBIAN_FRONTEND=noninteractive apt-get -qq -y install apt-fast

sudo apt-fast -qq -y install git python-dev python-pip wget sudo vim unzip curl

# Install supervisor 3.2.3 via pip install, and mimic installation structure and configs of apt-get install.
sudo pip install supervisor
sudo mkdir /etc/supervisor
sudo mkdir /etc/supervisor/conf.d
sudo mkdir /var/log/supervisor
sudo cp ~/docker-stack/buildtools/utils/initd-supervisor /etc/init.d/supervisor
sudo cp ~/docker-stack/buildtools/utils/supervisord.conf /etc/supervisor/

sudo apt-fast -y install ncdu ntp fail2ban htop

#sudo add-apt-repository -y ppa:tualatrix/ppa
#sudo apt-fast update
#sudo apt-fast -y install ubuntu-tweak

curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

echo unattended-upgrades unattended-upgrades/enable_auto_updates boolean true | sudo debconf-set-selections
sudo apt-fast -y install unattended-upgrades
