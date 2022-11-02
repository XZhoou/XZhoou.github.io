---
title: Github & Hexo 搭建个人博客指南
date: 2022-11-2 10:47:05
tags: [技术帖]
copyright: true
categories: [学习，Github]
---

# Github & Hexo 搭建个人博客

## 下载Git

大家根据个人操作系统，直接在官网上进行下载即可。

<https://git-scm.com/downloads>

## 下载Node.js

同样的，根据个人的操作系统，在官网上进行下载即可。

<https://nodejs.org/en/download/>

## 创建Hexo环境

创建一个文件夹，用于存储以后的blog中的相关文件

打开`git bash` ，使用`cd`命令进入该文件夹

首先输入命令&#x20;

```text
hexo init
```

因为我们的目标是建立一个博客网站，肯定不能总是在我们自己的设备上闭门造车，终究是要推送到互联网上，让其他的用户可以访问我们博客上的优质内容。

将本地利用hexo建立的博客推送到远端，打开根目录下的`_config.yml`文件，进行修改。

```yaml
deploy:
  type: git
  # 本来只有type这一行，后边两行需要我们自己输进去
  # repo就是我们先前创建好的github代码仓的url
  repo: 'https://github.com/XZhoou/XZhoou.github.io'
  # branch，表示在这个代码仓的master分支上创建博客内容，默认为master，在此我们直接给出，更加直观
  branch: 'master'
```

<!--more-->

## 创建自己的第一篇博客文章

在使用`hexo init` 命令后，会自动创建一篇名为`《hello world》`的博客文章。

那么在之后需要新建博客文章时，可以通过

```纯文本
hexo n '文章标题'
```

创建新的博客文章。

在此过程中，会在`source/_post/`目录下，生成一个新的`markdown`文件，文件名即为先前输入的`文章标题`。

## 修改主题界面

利用文本编辑器打开博客所在文件夹根目录下的`_config.yml`文件

```yaml
# Extensions
## Plugins: https://hexo.io/plugins/
## Themes: https://hexo.io/themes/
theme: yilia # 修改为你的themes文件夹中已有的主题即可
```

不同的模板文件配置方法可能略有区别，笔者目前使用的是`yilia`主题，具体的配置文件可以参考下方链接。

<https://github.com/litten/hexo-theme-yilia>

除此之外，还有很多其他的优秀主题如

<https://github.com/iissnan/hexo-theme-next>

<https://github.com/ppoffice/hexo-theme-icarus>

<https://github.com/blinkfox/hexo-theme-matery>

（之后的配置设置均以`yilia`模板为例）

### subnav调整

subnav，实际上就是把我们个人其他的社交平台账号例如

*   微博，知乎，豆瓣

*   Github

等入口，放在我们个人博客的对应位置，可以让访客更加全面的了解你创作的其他内容，起到引流的作用。

```yaml
# SubNav
subnav:
  github: "https://github.com/XZhoou"
  #weibo: #
  #rss: "#"
  #zhihu: 
  #qq: "#"
  #weixin: "#"
  #jianshu: "#"
  #douban: "#"
  #segmentfault: "#"
  #bilibili: "#"
  #acfun: "#"
  # mail: "buaasqh@163.com"
  #facebook: "#"
  #google: "#"
  #twitter: "#"
  #linkedin: "#"
```

取消对应行的注释，并将其他社交平台的个人主页的url填入即可（必须是完整路径，否则无法链接到对应平台）

### 修改打赏界面的字体

yilia主题默认的打赏界面，背景色是透明度比较低的浅蓝色，默认字体像加粗的楷体。

楷体emmm，在word文档中看起来还不错，但是在网站上就显得不是那么好看，所以打算把他换掉。

如果在`themes/yilia/source-src/css/reward.scss`文件中修改，是没有作用的！！！

在浏览器中，用F12打开控制台发现对应的页面元素，实际上`themes/yilia/source/main.0cf68a.css`在发挥着作用，用编辑器打开后发现是一坨扭在一起的代码，实在是不堪入目。（可以利用编辑器的插件将文档格式化排布）查找reward关键词，进行如下修改

```css
/* 是调整描述性文字的字体类型 */
.page-reward .reward-p {
    /* 在font-family 中加入自己中意的文字形式即可 */
    font-family: "Arial", "Microsoft YaHei", "黑体", "宋体", sans-serif;
    color: #fff;
    font-weight: 700;
    text-shadow: 1px 1px 1px #45b9e0
        /* text-shadow: 1px 1px 1px #4767d1 */
}

/* 是调整微信和支付宝两个词的字体风格的 */
.page-reward .reward-type {
    font-family: "Arial", "Microsoft YaHei", "黑体", "宋体", sans-serif;

    font-size: 16px;
    display: block;
    color: #4d4d4d;
    margin: 20px 0 0
}
```

### Hexo修改网站icon

如果没有网站的icon，看起来就是下面这个样子（没有黑志愿北京的意思）

![image-20221102110847533](https://pics-1309385371.cos.ap-beijing.myqcloud.com//typora-mac/image-20221102110847533.png)

需要在比特虫网站上将你自己的图标转化为ico格式

<https://www.bitbug.net/>

动手尝试之后，发现这种方法行之有效

<https://blog.csdn.net/u013592576/article/details/121295187?spm=1001.2101.3001.6650.1&utm_medium=distribute.pc_relevant.none-task-blog-2~default~CTRLIST~Rate-1.pc_relevant_default&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2~default~CTRLIST~Rate-1.pc_relevant_default&utm_relevant_index=2>

关键步骤：

*   将`favicon.ico`转化为`favicon.png`格式 (利用windows10的图片工具即可转换，点击`另存为`，选择保存为png格式)

*   将`favicon.png`保存在`source/img/`文件夹下

*   打开`themes/yilia/_config.yml`，找到`favicon`，修改成`favicon: /img/favicon.png`

*   清除浏览器缓存，刷新网页即可（Edge浏览器在`设置-隐私，搜索和服务-清除浏览数据`中操作即可）

### Hexo添加分类页面（Archives & Categories）

网站的界面，如果只有一个主页的选项，看起来就会比较单调，所以打算选择添加两个新的页面`分类`和`归档`

添加分类界面主要参考了

<https://blog.csdn.net/dta0502/article/details/89607895>

```text
hexo new page ”categories"

```

同时修改生成文件夹中的`index.md`文件，加入对应的参数即可

```纯文本
---
title: 文章分类
date: 2019-12-04 18:20:29
type: "categories"
layout: "categories"
comments: false
---
```

然后在`yilia/souce/main.0cf68a.css`中加入

```纯文本
category-all-page {
    margin: 30px 40px 30px 40px;
    position: relative;
    min-height: 70vh;
  }
  .category-all-page h2 {
    margin: 20px 0;
  }
  .category-all-page .category-all-title {
    text-align: center;
  }
  .category-all-page .category-all {
    margin-top: 20px;
  }
  .category-all-page .category-list {
    margin: 0;
    padding: 0;
    list-style: none;
  }
  .category-all-page .category-list-item-list-item {
    margin: 10px 15px;
  }
  .category-all-page .category-list-item-list-count {
    color: $grey;
  }
  .category-all-page .category-list-item-list-count:before {
    display: inline;
    content: " (";
  }
  .category-all-page .category-list-item-list-count:after {
    display: inline;
    content: ") ";
  }
  .category-all-page .category-list-item {
    margin: 10px 10px;
  }
  .category-all-page .category-list-count {
    color: $grey;
  }
  .category-all-page .category-list-count:before {
    display: inline;
    content: " (";
  }
  .category-all-page .category-list-count:after {
    display: inline;
    content: ") ";
  }
  .category-all-page .category-list-child {
    padding-left: 10px;
  }
```

最后修改`yilia/_config.yml`，在menu处做出如下修改即可

```纯文本
menu:
  主页: /
  分类: /categories #添加上这一行即可
  归档: /archives

```

如果需要多级分类的功能，则需要在`yilia/layout/`目录下，新增一个`categories.ejs`文件，内容设置为

```纯文本
<article class="article article-type-post show">
  <header class="article-header" style="border-bottom: 1px solid #ccc">
  <h1 class="article-title" itemprop="name">
    <%= page.title %>
  </h1>
  </header>

  <% if (site.categories.length){ %>
  <div class="category-all-page">
    <h2>共计&nbsp;<%= site.categories.length %>&nbsp;个分类</h2>
    <%- list_categories(site.categories, {
      show_count: true,
      class: 'category-list-item',
      style: 'list',
      depth: 2,
      separator: ''
    }) %>
  </div>
  <% } %>
</article>
```

### Yilia 不显示最后的说明性文字

默认情况下，网页的最下部会有一个

![image-20221102110828824](https://pics-1309385371.cos.ap-beijing.myqcloud.com//typora-mac/image-20221102110828824.png)

看起来有点突兀，可以打开`yilia/layout/_partial/footer.ejs`文件，找到

`<a href="http://hexo.io/" target="_blank">Hexo</a>  Theme <a href="https://github.com/litten/hexo-theme-yilia" target="_blank">Yilia</a> by Litten`所在行注释即可

## 购买域名&网络配置

查找资料后发现，在国内的域名服务商购买域名，需要有3个月以上的配套服务器，所以我果断选择了境外的域名服务商购买域名

`.com`无疑是最通用的域名，但是由于初次尝试，我选择了性价比比较高的`.top`域名，一年只需1.19\$，很适合买来自己折腾一下

下面是我购买域名的服务商网站

<https://www.namesilo.com/>

付款方式也是比较多样的，可以选择银联，支付宝，微信支付等（我在微信支付的时候遇到了问题，不知道现在修复了没有）

大家也可选择GoDaddy，根据个人需求和喜好即可

<https://sg.godaddy.com/>

在购买域名后，加入新的CNAME记录和A记录 **（但如果后续要利用腾讯云等进行CDN加速的话，就可以暂时不配置，否则会白白的多等待一天时间）**

将自己的域名添加新的主机记录，具体步骤可以参考

<https://zhuanlan.zhihu.com/p/393050270>

同时不要忘记在Github项目的settings的Pages中的Custom Domain填写已经购买好的域名，之后就可以用你的域名访问，代替`xxxxx.github.io`这样的网址了

