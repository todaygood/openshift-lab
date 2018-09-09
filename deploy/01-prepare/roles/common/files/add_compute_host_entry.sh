#!/usr/bin/env bash

HOSTFILE=$1
MAPFILE=$2

while read host_entry
do 
   hostname=$( echo $host_entry |awk '{print $3}' )
  
   sed -i "/$hostname/d"  $HOSTFILE
   echo $host_entry >>    $HOSTFILE

done  < $MAPFILE

