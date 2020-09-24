#!/bin/bash

# Coded by Mandr4x #

clear
echo -e "Wordlist: "; read host
cat $host |parallel -j50 'request=$(timeout 5 curl -k -s {} |grep "WordPress" |head -n1 |cut -d ">" -f1 |cut -d "<" -f2 |cut -d "/" -f1 |cut -d "=" -f3 |cut -d " " -f2 |xargs -0)
echo -e "{} - $request"' >> word
sed 's/\"//g' word >> wordpress
echo "" >> word ; rm -rf word
