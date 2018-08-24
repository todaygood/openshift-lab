#!/usr/bin/env bash
#date:06-04-2013

if [ $# -lt 1 ] 
then 
	echo "$0 host_map_file"
	echo "host_map_file:"
	echo "           host map is a map file which contain  ip address  and password  which they are  separated by spaces"
	exit 1 
fi 

DIR=$(dirname $0)
$DIR/remove_know_hosts.sh $1 

# remove strict host key checking 
echo "StrictHostKeyChecking no" >  ~/.ssh/config

identify_file=~/.ssh/id_rsa.pub

HOST_MAP_FILE=$1
while read line; do  
#   echo $line 

   host=$(echo $line | awk '{print $1}') 
   passwd=$(echo $line | awk '{print $2}') 

   ping -c 2 -W 1 $host
   if [ $? = 0 ]
   then
#      sshpass -p "$passwd" ssh $host "echo $id >>~/.ssh/authorized_keys"
      sshpass -p "$passwd" ssh-copy-id -i ${identify_file}  root@${host}
   else
      echo "$host is lost" 
   fi
   
done  < $HOST_MAP_FILE 




