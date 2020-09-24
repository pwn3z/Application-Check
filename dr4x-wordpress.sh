#!/bin/bash

# Coded by Mandr4x #

clear
echo -e "Wordlist: "; read host
cat $host |parallel -j50 'request=$(timeout 5 curl -k -s {} |grep "WordPress" |head -n1 |cut -d ">" -f1 |cut -d "<" -f2 |cut -d "/" -f1 |cut -d "=" -f3 |cut -d " " -f2 |xargs -0)
echo -e "{} - $request"' >> word
cat word |grep '"' >> word2
sed 's/\"//g' word2 >> wordpress
echo "" > word ; echo "" > word2 ; rm -rf word word2
