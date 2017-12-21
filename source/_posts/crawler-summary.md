---
title: crawler-summary
date: 2017-12-21 10:00:48
tags: summary
---

#1.爬虫分类
* 数据爬虫
 * 深度爬虫
   * 页面爬虫
     * 静态页面
     * 动态页面
   * 接口类爬虫
     * 网站接口
     * app接口
 * 垂直爬虫

* 业务爬虫

#2.爬虫问题
##2.1 目标
* 断点续爬
* 分布式部署
* 监控报警
  * 服务进程
  * 成功率
  * 改版
* 无缝发版
* 服务高可用
* 并发

##2.2 爬虫中的问题
* 数据包获取
* 封IP，请求次数限制
* 验证码限制
* 页面动态渲染
* 请求重定向
* 失败重爬
* 爬虫结果返回
* cookies信息维护
* 单点登录
* 数据加密
  * js 加密
  * app 加密
    * apk加壳
    * native方法加密
    * 自定义加密
* 系统陈旧、数据复杂。。。

#3.解决方案
##3.1 工具
###3.1.1 抓包工具
* chrome dev-tool
* burp site
* charles

###3.1.2 逆向工具
* apktool
* enjarify
* jd-gui/jadx-gui
* android studio
* ida
* xposed

##3.2开发组件
###3.2.1 基础框架 [alpha](https://github.com/Geek-Union/alpha.git)
###3.2.2 爬虫框架 [webmagic](https://github.com/code4craft/webmagic)
> WebMagic项目代码分为核心和扩展两部分。核心部分(webmagic-core)是一个精简的、模块化的爬虫实现，而扩展部分则包括一些便利的、实用性的功能。WebMagic的架构设计参照了Scrapy，目标是尽量的模块化，并体现爬虫的功能特点。
> webmagic 总体架构:
  ![](crawler-summary/webmagic.png)

###3.2.3 消息组件 rabbitmq
* 利用ack机制，确保消息被正确消耗，达到断点续爬
* 新旧爬虫监听同个队列确保服务的无缝发版
* 实现爬虫的分布式部署
* 使用定制的spring－rabbitmq模块实现接口类爬虫的rpc调用

###3.2.4 服务注册 zookeeper
* 服务注册中心，实现爬虫服务的注册与发现

###3.2.5 缓存 redis
* 缓存可用代理IP
* 缓存ip黑名单信息
* 同步zookeeper中爬虫服务节点信息，减少zookeeper压力
* 缓存爬虫配置信息

###3.2.6 代理池维护

###3.2.7 nginx
> 通过nginx的流量切换实现爬虫服务API层无缝发版

##3.3第三方服务
###3.3.1 打码服务
* [tesseract-ocr](https://github.com/tesseract-ocr)(开源)
> 一款由HP实验室开发由Google维护的开源OCR（Optical Character Recognition , 光学字符识别）引擎，与Microsoft Office Document Imaging（MODI）相比，我们可以不断的训练的库，使图像转换文本的能力不断增强；如果团队深度需要，还可以以它为模板，开发出符合自身需求的OCR引擎。
* [超级鹰](http://www.chaojiying.com/)（收费）

###3.3.2 代理池服务
* [阿布云](https://www.abuyun.com/)（单一代理IP）
* [无忧](http://www.data5u.com/)（返回代理IP列表）
* [adsl主机]()（返回代理IP列表）

##3.4 apk逆向
* 抓包
* smali动态调试
* dump内存信息
* hook String 构造函数
* 创建android httpServer 提供so加密服务

#4.爬虫优化
##4.1 初次优化--爬虫框架异步优化，替换结果接口类爬虫结果汇总策略
* 使用asyncHttpClient代替httpclient
* 引入rabbitmq的RPC，消除因服务器系统时间不一致而造成的爬虫结果汇总bug

##4.2 再次优化--rabbitmq、日志优化、部署优化
* 把爬虫服务按一定规则分组，减少对列和消费者数量
* 超时时间在小范围内随机，使rabbitmq消息结果返回更"均匀"
* 优化日志,调整队列大小、使用异步方式打印日志

##4.3 第三次优化--服务接口优化

#5.爬虫监控
##5.1 服务器监控
> 使用nagios监控
* 服务进程
* 内存信息
* 磁盘占用情况

##5.2 日志分类
* nginx日志
  * 修改nginx日志打印格式为json
* 程序日志
  * API使用MDC加入请求uuid信息，
  * 编写注解打印关键方法执行信息日志
  * 普通日志

##5.3 ELK流程
> logstash -> kafka -> logstash -> es(x=pack) -> kinaba
* 日志监控报警
* 爬虫请求、成功率、图表展示

#6.常用反爬策略
* Heaader
 * User-Agent
 * Accept-Charset
 * Cookie
 * Content-Type
 * Referer
* Cookies验证
* ip限制
* 验证码
 * 字符识别验证
 * 简单四则运算
 * 滑块验证
* 常用数据加密算法
 * Base64编码
 * MD5
 * AES
 * DES
 * DESede
 * RSA

