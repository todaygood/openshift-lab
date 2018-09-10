
# Service《-》Pods
Route service traffic to pods with label keys and values matching this selector
via label

# Deployment 《-》Pods

via Selector 

# Headless service 
特点是Cluster-ip 是None , 在pod内部,service name 就对应了后端pods 列表。
用来干什么呢？ 用于开发者自己根据pods进行负载均衡器的开发。

https://www.do1618.com/archives/1055/k8s%E4%B9%8Bheadless-service/


```bash
[root@ose0 ~]# oc get service 
NAME            TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
nginx-service   ClusterIP   None            <none>        80/TCP     1d
ruby-ex         ClusterIP   172.30.150.29   <none>        8080/TCP   42d

[root@ose0 ~]# oc get deployment
NAME               DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   2         2         2            2           1d

[root@ose0 ~]# oc get pods
NAME                               READY     STATUS      RESTARTS   AGE
nginx-deployment-d54cf54b6-tpk57   1/1       Running     0          1d
nginx-deployment-d54cf54b6-vjvh7   1/1       Running     0          1d


[root@ose0 ~]# oc rsh nginx-deployment-d54cf54b6-vjvh7
# ping nginx-service
PING nginx-service.hello.svc.cluster.local (10.128.2.9): 48 data bytes
56 bytes from 10.128.2.9: icmp_seq=0 ttl=64 time=2.236 ms
56 bytes from 10.128.2.9: icmp_seq=1 ttl=64 time=0.414 ms
--- nginx-service.hello.svc.cluster.local ping statistics ---
2 packets transmitted, 2 packets received, 0% packet loss

```
