#!/bin/bash

# DEPENDENCIES # 
# apt install proxychains4 nmap tor -y ; service tor start #
# Coded by Mandr4x #

clear
echo -e "TOR List: "; read var

for i in `cat $var`
do
response=$(timeout 10 proxychains4 -q -f /etc/proxychains.conf /usr/bin/nmap -sT -PN -n -p 80 $i |grep -oP "open")
titulo=$(timeout 4 curl --socks5-hostname localhost:9050 -s $i |grep "title" |head -n1 |awk -F '<title>' '{print $2}' |awk -F '</title>' '{print $1}')
if [ "$response" = "open" ]
then
echo -e "\033[01;37m$i\033[01;37m \033[01;31m-\033[01;31m \033[01;32mONLINE\033[01;32m \033[01;31m-\033[01;31m \033[01;36mTITLE:\033[01;36m \033[01;35m$titulo\033[01;35m"
echo -e "http://$i/ - $titulo" >> online
else
echo -e "\033[01;37m$i\033[01;37m \033[01;36m-\033[01;36m \033[01;31mOFFLINE\033[01;31m"
fi
done
