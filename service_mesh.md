 
# 服务网格

是一个基础设施层，主要用于处理服务间的通信，云原生应用有着复杂的服务拓扑， 服务网格负责在这些拓扑中实现请求的可靠传递。

在实践中，服务网格通常实现为一组轻量级网格代理，他们与应用程序部署在一起，而对应用程序透明。


当微服务数量增多达到几十上百时，服务网格就会呈现服务网格状


# Istio 

Istio 是一个Google ,IBM 联合开发的完全开源的服务网格，可以透明的分层到现有的分布式应用中，

保护，连接和监控微服务。 

Istio 架构

分为控制面，和数据面

控制面： 负责管理和配置代理来路由流量
- Pilot: 提供服务发现功能

- Mixer：执行访问控制和使用策略，并从Envoy代理和其他服务中收集遥测数据。

- Citadel : 提供服务与服务间的身份验证 


数据面： 由一组以sidecar方式部署的智能代理组成， 默认使用Envoy做智能代理。

- Envoy: 用C++开发的高性能代理， 用于调解service mesh中所有的入站和出站流量。 
         内置由动态服务发现， 负载均衡，熔断器， 健康检查， HTTP/2和gRPC代理等。 

微服务应用中的核心需求：

- 流量管理：控制服务之间流量和API调用。
- 可观察性：了解服务之间依赖关系，以及他们之间的流量流向

- 策略执行： 微服务之间使用策略来进行互动，确保访问策略得以执行，执行是通过配置网格而不是修改程序代码。

-  服务身份安全： 为网格中的服务提供可靠身份验证

      
# Todo

https://istio.io/docs/setup/kubernetes/download-release/

## Istio in k8s 

https://developers.redhat.com/blog/2018/04/05/coolstore-microservices-service-mesh-part-1-exploring-auto-injection/	


## Istio in Openshift 


https://blog.openshift.com/evaluate-istio-openshift/

https://developers.redhat.com/blog/2018/04/05/coolstore-microservices-service-mesh-part-1-exploring-auto-injection/


