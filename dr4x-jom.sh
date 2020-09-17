#!/bin/bash

# Coded by Mandr4x #

echo -e "wordlist: "; read host
for i in `cat $host`
do
request=$(timeout 5 curl -s http://$i/administrator/manifests/files/joomla.xml |grep -oP "joomla.org" |head -n1)
request2=$(timeout 5 curl -s -k https://$i/administrator/manifests/files/joomla.xml |grep -oP "joomla.org" |head -n1)
if [ "$request" = "joomla.org" ] || [ "$request2" = "joomla.org" ]
then
echo -e "\033[01;32m$i - RUN JOOMLA\033[01;32m"
echo -e "$i" >> jm
else
echo -e "\033[01;31m$i - NOT RUN JOOMLA\033[01;31m"
fi
done
