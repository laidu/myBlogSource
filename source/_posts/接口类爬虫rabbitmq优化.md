# 接口类爬虫rabbitmq优化

* 1、使用非持久化队列
* 2、数据返回不通过rabbitmq
* 3、独立进程数据“统一获取，统一返回”
* 4、多头类爬虫稳定性，同一手机号多次请求返回结果