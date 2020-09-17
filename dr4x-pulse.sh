#!/bin/bash

# Coded by Mandr4x #

echo -e "wordlist: "; read host
for i in `cat $host`
do
request=$(timeout 5 curl -k -s https://$i/dana-na/auth/url_default/welcome.cgi |grep -oP "/dana-na/css/" |head -n1)
if [ "$request" = "/dana-na/css/" ]
then
echo -e "\033[01;33m\033[01;32m$i - Pulse Secure Detected.\033[01;33m\033[01;32m"
echo -e "$i" >> pulse-output
else
echo -e "\033[01;33m\033[01;31m$i - Don't Running Pulse Secure.\033[01;33m\033[01;31m"
fi
done
