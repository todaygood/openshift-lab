
# 安装os 

disable swap 


# installer

yum install -y atomic-openshift-utils

以下操作均在安装服务器上做。
# prepare 

1. main.sh



2. config dns

host上edit /etc/hosts
配置dnsmasq,做全局的dns server

3 modify inventory file 

vim /etc/ansible/hosts
deployment_type=origin ,使用centos操作系统,默认为penshift-enterprise，是适用于rhel的。
refer: https://github.com/openshift/openshift-ansible/blob/master/DEPLOYMENT_TYPES.md

如果有lb server ,则 

openshift_master_cluster_hostname=openshift-internal.cloud.genomics.cn
openshift_master_cluster_public_hostname=openshift-cluster.cloud.genomics.cn
这个设置中的hostname要dns能获取到。 




4. run pre 
[root@ose0 playbooks]# ansible-playbook prerequisites.yml 

碰到问题
https://github.com/openshift/openshift-ansible/issues/3705

solution:
enable_excluders=false

5. run deploy
[root@ose0 playbooks]# ansible-playbook deploy_cluster.yml

Issue: memory检查不通过

要求:
    recommended_memory_bytes = {
        "oo_masters_to_config": 16 * GIB,
        "oo_nodes_to_config": 8 * GIB,
        "oo_etcd_to_config": 8 * GIB,
    }

Workaround:
   master 3个节点至少16G,node,etcd等节点最少8G内存。


6. Post-Install

login web console 

# create user 

ref doc 2.2 

注意以下命令需要在三个master上执行，因为lb会随机到某个master上去。
systemctl restart origin-master-api origin-controllers 

htpasswd -b /etc/origin/master/htpasswd admin redhat 

systemctl restart origin-master-api origin-controllers 


赋予权限,以下命令在一个master上运行即可。
oc adm policy add-cluster-role-to-user  cluster-admin admin


oc login -u admin 如果认证成功，web console也会成功。

