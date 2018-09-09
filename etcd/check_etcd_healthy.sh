
ENDPOINTS=https://ose0.cloud.genomics.cn:2379,https://ose1.cloud.genomics.cn:2379,https://ose2.cloud.genomics.cn:2379

etcdctl -C $ENDPOINTS  \
     --ca-file=/etc/origin/master/master.etcd-ca.crt \
     --cert-file=/etc/origin/master/master.etcd-client.crt \
     --key-file=/etc/origin/master/master.etcd-client.key cluster-health

