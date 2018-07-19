#!/usr/bin/env bash

for ip in $(cat $1 | awk '{print $1}')
do 
  # echo $ip 
   sed -i  "/$ip/d"  ~/.ssh/known_hosts 
done 
