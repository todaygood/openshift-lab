
Service accounts provide a flexible way to control API access without sharing a regular user’s credentials.


# 自带scc有  anyuid , hostaccess, hostmount-anyuid,hostnetwork,nonroot,privileged,restricted等几种。
```bash
[root@ose0 scc]# oc get scc
NAME               PRIV      CAPS      SELINUX     RUNASUSER          FSGROUP     SUPGROUP    PRIORITY   READONLYROOTFS   VOLUMES
anyuid             false     []        MustRunAs   RunAsAny           RunAsAny    RunAsAny    10         false            [configMap downwardAPI emptyDir persistentVolumeClaim projected secret]
hostaccess         false     []        MustRunAs   MustRunAsRange     MustRunAs   RunAsAny    <none>     false            [configMap downwardAPI emptyDir hostPath persistentVolumeClaim projected secret]
hostmount-anyuid   false     []        MustRunAs   RunAsAny           RunAsAny    RunAsAny    <none>     false            [configMap downwardAPI emptyDir hostPath nfs persistentVolumeClaim projected secret]
hostnetwork        false     []        MustRunAs   MustRunAsRange     MustRunAs   MustRunAs   <none>     false            [configMap downwardAPI emptyDir persistentVolumeClaim projected secret]
nonroot            false     []        MustRunAs   MustRunAsNonRoot   RunAsAny    RunAsAny    <none>     false            [configMap downwardAPI emptyDir persistentVolumeClaim projected secret]
privileged         true      [*]       RunAsAny    RunAsAny           RunAsAny    RunAsAny    <none>     false            [*]
restricted         false     []        MustRunAs   MustRunAsRange     MustRunAs   RunAsAny    <none>     false            [configMap downwardAPI emptyDir persistentVolumeClaim projected secret]
```


oc describe scc restricted

# 默认的sa有builder,default,deployer 等三种。

```bash
[root@ose0 scc]# oc get sa
NAME       SECRETS   AGE
builder    2         41d
default    2         41d
deployer   2         41d

[root@ose0 scc]# oc describe sa default 
Name:                default
Namespace:           hello
Labels:              <none>
Annotations:         <none>
Image pull secrets:  default-dockercfg-fgjxm
Mountable secrets:   default-token-6tdkl
                     default-dockercfg-fgjxm
Tokens:              default-token-6tdkl
                     default-token-prmqr
Events:              <none>
```

首先是application需要某种能力，那就先看看系统预定义的几种scc是否满足， 如果不能满足，那就需要new scc

参见：https://blog.openshift.com/understanding-service-accounts-sccs/

$ oc create serviceaccount useroot

$ oc adm policy add-scc-to-user anyuid -z useroot

$ oc patch dc/myAppNeedsRoot --patch '{"spec":{"template":{"spec":{"serviceAccountName": "useroot"}}}}'




