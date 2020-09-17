#!/bin/bash

# Coded by Mandr4x #

echo -e "wordlist: "; read host
for i in `cat $host`
do
request=$(timeout 3 curl -s -k https://$i/ |grep "remote" |grep -oP "/remote/login")
if [ "$request" = "/remote/login" ]
then
echo -e "$i - Running Fortinet SSL"
echo -e "https://$i:10443/" >> 3
else
echo -e "$i - Don't Running Fortinet SSL"
fi
done
