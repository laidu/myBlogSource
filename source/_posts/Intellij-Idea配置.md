---
title: Intellij_Idea配置
date: 2017-11-04 15:38:34
tags:
---

## 1 基础配置

### 1.1 字体外观
### 1.2 代码智能提示
### 1.3 github token生成
### 1.4 自定义配置、VM配置

## 2 常用插件

### 2.1 lombok
### 2.2 GsonFormat
### 2.3 Alibaba Java Coding Guidelines
### 2.4 Grep Console
### 2.5 CheckStyle-IDEA
### 2.6 FindBugs-IDEA
### 2.7 Statistic
### 2.3 Jindent-Source Code Formatter
### 2.3 CamelCase

## 3 代码模版

### 3.1 code-template

#### 3.1.1 文件创建信息

```java
    #if (${PACKAGE_NAME} && ${PACKAGE_NAME} != "")package ${PACKAGE_NAME};#end
    /**
     * ${DESCRIPTION}
     *
     * Created by tiancai.zang on ${YEAR}-${MONTH}-${DAY} ${HOUR}-${MINUTE}.
     */
```

#### 3.1.2 常用注解

```java
    #if (${PACKAGE_NAME} && ${PACKAGE_NAME} != "")package ${PACKAGE_NAME};#end
    #set($name=${NAME.toLowerCase()}+${PACKAGE_NAME.toLowerCase()})
    #set($slf4j=${name.contains("controller")} || ${name.contains("impl")} || ${name.contains("util")} || ${name.contains("test")})
    #set($controller=${name.contains("controller")})
    #set($service=${name.contains("impl")})
    #set($data=${name.contains("dto")} || ${name.contains("entity")} || ${name.contains("model")})
    #set($test=${name.contains("test")})

    #if ($slf4j || !$data) import lombok.extern.slf4j.Slf4j;#end
    #if ($service) import org.springframework.stereotype.Service;#end
    #if ($controller)import org.springframework.web.bind.annotation.RestController;import org.springframework.web.bind.annotation.RequestMapping;#end
    #if ($data) import lombok.AllArgsConstructor;import lombok.Builder;import lombok.Data;import lombok.NoArgsConstructor;#end
    /**
     * ${Description}
     *
     * Created by tiancai.zang on ${YEAR}-${MONTH}-${DAY} ${HOUR}:${MINUTE}.
     */
    #if ($slf4j || !$data) @Slf4j #end
    #if ($controller) @RestController@RequestMapping("/") #end
    #if ($service) @Service #end
    #if ($data) @Data@Builder@AllArgsConstructor@NoArgsConstructor #end
    public class ${NAME} {

    }

```

### 3.2 live-template

#### 3.2.1 日志打印

```java
	log.info("$VAR_NAME_COPY$'s value : {}", $VAR_NAME$);
```
> 需要调整变量次序和默认值，因为在 "" 内输入变量名时，idea并不会有提示。

![](log-live-template.png)

#### 3.2.2 注释

```java
    /**
     * step $NUMBER$ : $DESCRIPTION$
     */
```

## 4 常用快捷键

