#!/bin/bash

ENDPOINTS=https://ose0.cloud.genomics.cn:2379,https://ose1.cloud.genomics.cn:2379,https://ose2.cloud.genomics.cn:2379


command=" etcdctl -C $ENDPOINTS  \
     --ca-file=/etc/origin/master/master.etcd-ca.crt \
     --cert-file=/etc/origin/master/master.etcd-client.crt \
     --key-file=/etc/origin/master/master.etcd-client.key "
     
echo "cluster health:"     
$command  cluster-health

echo "member list"
$command member list


echo "user list"
$command user list

