#!/bin/bash
clear
# Coded by Mandr4x #

echo -e "wordlist: "; read host

cat $host |parallel -j100 'request=$(timeout 5 curl -s http://{}/administrator/manifests/files/joomla.xml |grep -oP "joomla.org" |head -n1)
request2=$(timeout 5 curl -s -k https://{}/administrator/manifests/files/joomla.xml |grep -oP "joomla.org" |head -n1)
if [ "$request" = "joomla.org" ] || [ "$request2" = "joomla.org" ]
then
echo -e "\033[01;32m{} - RUN JOOMLA\033[01;32m"
echo -e "$i" >> joomla
else
echo -e "\033[01;31m{} - NOT RUN JOOMLA\033[01;31m"
fi'
