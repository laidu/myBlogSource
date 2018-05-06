#!/usr/bin/env bash

#   function :
#        init hexo env
#    require :
#        node git
#    usage :
#            1. sh init_env.sh


npm install hexo --save

npm install hexo-migrator-wordpress --save
npm install hexo-generator-feed --save

npm install hexo-renderer-marked --save
npm install hexo-generator-search --save

#自动为站外链接添加nofollow属性
npm install hexo-autonofollow --save

#生成博客的sitemap。
npm install hexo-generator-sitemap --save

#用于生成静态站点数据，提供搜索功能的数据源。
npm install hexo-generator-json-content --save

#为文章添加文章字数统计、文章预计阅读时间
#通过以上安装后，你可以在你的模板文件加入以下相关的标签实现本插件的功能
#**字数统计:**WordCount
#**阅读时长预计:**Min2Read
#总字数统计: TotalCount
npm install hexo-wordcount --save
#RESTful JSON数据生成插件。
npm install hexo-generator-restful --save
npm install hexo-renderer-marked --save
npm install hexo-renderer-stylus --save

## rss插件
npm install hexo-generator-feed --save
## 站点sitemap生成插件
npm install hexo-generator-sitemap --save
npm install hexo-generator-baidu-sitemap --save
## 百度url提交
npm install hexo-baidu-url-submit --save
## 本地搜索插件集成
npm install hexo-generator-search --save
