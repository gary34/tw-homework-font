# font

> thoughtworks 作业之前端应用 http://f.iyomi.me:8999
> 
# 功能描述

js往后端服务器请求查询，并得到ip对应的国家和城市. 

同时下部的文字描述了代码的git版本号，和构建环境。

## Jenkins 截图
执行历史
![执行历史](https://iyomi-public.oss-cn-shenzhen.aliyuncs.com/2018-04-22%2015.00.14.png)

工作流
![工作流](https://iyomi-public.oss-cn-shenzhen.aliyuncs.com/%202018-04-22%2015.00.40.png)

部署之后的效果
![页面](https://iyomi-public.oss-cn-shenzhen.aliyuncs.com/2018-04-22%2015.04.29.png)

## CI&CD
持续集成工作流： 提交代码 -》自动构建-》本地测试-》根据分支选择不同的环境部署
文件说明：

1. Jenkins 工作流描述文件
2. Dockerfile 构建docker镜像描述文件

 
## Build Setup

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build

# build for production and view the bundle analyzer report
npm run build --report
```

For a detailed explanation on how things work, check out the [guide](http://vuejs-templates.github.io/webpack/) and [docs for vue-loader](http://vuejs.github.io/vue-loader).


