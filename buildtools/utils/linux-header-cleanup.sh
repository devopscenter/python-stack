#!/bin/bash

#http://askubuntu.com/questions/304810/dependency-problems-prevent-configuration-of-linux-headers-virtual

sudo apt-get remove linux-headers-virtual linux-virtual  
sudo apt-get install linux-headers-virtual linux-virtual
sudo apt-get -f install
sudo apt-get autoremove
