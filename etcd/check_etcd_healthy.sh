
ENDPOINTS=http://ose0.cloud.genomics.cn:2379,http://ose1.cloud.genomics.cn:2379,http://ose2.cloud.genomics.cn:2379

etcdctl -C $ENDPOINTS  \
     --ca-file=/etc/origin/master/master.etcd-ca.crt \
     --cert-file=/etc/origin/master/master.etcd-client.crt \
     --key-file=/etc/origin/master/master.etcd-client.key cluster-health

