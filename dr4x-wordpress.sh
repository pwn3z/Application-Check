#!/bin/bash

# Coded by Mandr4x #

echo -e "Wordlist: "; read host
for i in `cat $host`
do
request=$(timeout 5 curl -s http://$i/wp-admin/admin-ajax.php |grep -oP "0")
request2=$(timeout 5 curl -k -s https://$i/wp-admin/admin-ajax.php |grep -oP "0")
if [ "$request" = "0" ] || [ "$request2" = "0" ]
then
echo -e "\033[01;32m$i - Run WordPress\033[01;32m"
echo -e "$i" >> wp
else
echo -e "\033[01;31m$i - Not Run WordPress\033[01;31m"
fi
done
