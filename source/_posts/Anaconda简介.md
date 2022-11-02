---
title: Anaconda简介
date: 2022-01-23 10:30:15
tags: [技术帖]
copyright: true
categories: [学习,Anaconda]
---

## Anaconda是什么

> Anaconda是基于Python的环境管理工具，对于数据工作者来说更加友好，使用更加方便。通过Anaconda，可以更加便捷快速的实现不同项目下对Python版本的不同需求。

Anaconda包含conda，Python以及超过150个科学计算相关的软件库以及依赖。

## 包管理工具

### **conda**

> 如果你需要的包要求不同版本的Python，你无需切换到不同的环境，因为conda同样是一个环境管理器。仅需要几条命令，你可以创建一个完全独立的环境来运行不同的Python版本，同时继续在你常规的环境中使用你常用的Python版本。——[conda官方网站](https://conda.io/en/latest/)

用来在电脑上安装库和软件，`pip`是Python默认的库管理工具；`conda`与`pip`十分类似，但是更加关注与数据科学相关的库。

`conda`不仅可以支持Python的库，同样可以支持非Python的库，适用于认可软件库的包管理工具。（Python,R,Java,Javascript等）

但是，不是所有的Python库都可以通过Anaconda获得，仍需要`pip`继续安装其他的库。

> Anaconda安装了一些预编译的库，并加速了一些数学操作，所以会有一些延迟，需要做一些适配。

<!--more-->

### Anaconda

是一个包含180+的科学包及其依赖项的发行版本，包含conda，numpy，scipy，ipython notebook等

### pip

Python中用于安装和管理包的包管理器

- Python中默认安装的版本：
  - Python 2.7.9及后续版本：默认安装，命令为`pip`
  - Python 3.4及后续版本：默认安装，命令为`pip3`

### virtualenv

用于创建一个独立的Python环境的工具

解决问题：

1. 当一个程序需要使用Python 2.7版本，而另一个程序需要使用Python 3.6版本，如何同时使用这两个程序？
2. 如果将所有程序都安装在系统下的默认路径，如：`/usr/lib/python2.7/site-packages`，当不小心升级了本不该升级的程序时，将会对其他的程序造成影响。
3. 如果想要安装程序并在程序运行时对其库或库的版本进行修改，都会导致程序的中断。
4. 在共享主机时，无法在全局`site-packages`目录中安装包。

virtualenv将会为它自己的安装目录创建一个环境，这并**不与**其他virtualenv环境共享库；同时也可以**选择性**地不连接已安装的全局库。

### pip vs conda

#### → 依赖项检查

- pip： 
  -  **不一定**会展示所需其他依赖包。
  -  安装包时**或许**会直接忽略依赖项而安装，仅在结果中提示错误。
- conda： 
  - 列出所需其他依赖包。
  - 安装包时自动安装其依赖项。
  - 可以便捷地在包的不同版本中自由切换。

#### → 环境管理

- pip：维护多个环境难度较大。
- conda：比较方便地在不同环境之间进行切换，环境管理较为简单。

#### → 对系统自带Python的影响

- pip：在系统自带Python中包的**更新/回退版本/卸载将影响其他程序。
- conda：不会影响系统自带Python。

#### → 适用语言

- pip：仅适用于Python。
- conda：适用于Python, R, Ruby, Lua, Scala, Java, JavaScript, C/C++, FORTRAN。

### conda与pip、virtualenv的关系

- conda**结合**了pip和virtualenv的功能。



## 管理环境

### 创建新环境

Windows用户利用`Anaconda prompt`环境进行操作

```
conda create --name <enviroment_name> <package_name>
```

注意：

- `environment_name`即创建的环境名。建议以英文命名，且不加空格，名称两边不加尖括号“<>”。
- `package_name`即安装在环境中的包名。名称两边不加尖括号“<>”。
  1. 如果要安装指定的版本号，则只需要在包名后面以`=`和版本号的形式执行。如：`conda create --name python2 python=2.7`，即创建一个名为“python2”的环境，环境中安装版本为2.7的python。
  2. 如果要在新创建的环境中创建多个包，则直接在`package_name`后以**空格**隔开，添加多个包名即可。如：`conda create -n python3 python=3.5 numpy pandas`，即创建一个名为“python3”的环境，环境中安装版本为3.5的python，同时也安装了numpy和pandas。
- `--name`同样可以替换为`-n`。

提示：默认情况下，新创建的环境将会被保存在`/Users//anaconda3/env`目录下，其中，`user_name`为当前用户的用户名。

### 切换新环境

windows环境下

```
activate <enviornemt_name>
```

如果创建环境后安装Python时没有指定Python的版本，那么将会安装与Anaconda版本相同的Python版本，即如果安装Anaconda第2版，则会自动安装Python 2.x；如果安装Anaconda第3版，则会自动安装Python 3.x。

成功切换环境后，该行行首将以`(environment_name)`开头，其中`environment_name`为切换到的环境名

### 退出环境至root

windows环境下

```
conda deactivate
```

 当执行退出当前环境，回到root环境命令后，原本行首的字符不再显示

### 显示以创建的环境

```
conda info --envs
```

```
conda info -e
```

```
conda env list
```

 结果中星号“*”所在行即为当前所在环境。windows系统中默认创建的环境名为`base`。 

### 复制环境

```
conda create --name <new_environment_name> --clone <copied_environment_name>

```

注意： 

1. `copied_environment_name`即为被复制/克隆环境名。环境名两边不加尖括号“<>”。
2. `new_envrionment_name`即为复制之后新环境的名称。环境名两边不加尖括号“<>”。
3. 如：`conda create --name py2 --clone python2`，即为克隆名为“python2”的环境，克隆后的新环境名为“py2”。此时，环境中将同时存在“python2”和“py2”环境，且两个环境的配置相同。

### 删除环境

```
conda remove --name <environment_name> --all
```

### 重命名环境

conda实际上没有重命名的指令，实现重命名可以通过clone完成的

- 先clone一份新的环境
- remove旧的环境

```
conda create --name <new_environment_name> --clone <old_envornment_name> 
```

```
conda remove -name <old_environment_name> --all
```

## 管理包

### 查找可供安装的包版本

#### 精确查找

```
conda search --full-name <package_full_name>
```

注意：

1. `--full-name`为精确查找的参数。
2. `package_full_name`是被查找包的**全名**。包名两边不加尖括号“<>”。

例如：`conda search --full-name python`即查找全名为“python”的包有哪些版本可供安装。

#### 模糊查找

```
conda search <text>
```

- 注意：`text`是查找含有**此字段**的包名。此字段两边不加尖括号“<>”。
- 例如：`conda search py`即查找含有“py”字段的包，有哪些版本可供安装。

### 获取当前环境中已安装的包的信息

```
conda list
```

在终端显示当前环境已安装包的包名以及版本号

### 安装包

#### 在指定环境中安装包

```
conda install --name <environment_name> <package_name>
```

注意：

1. `environment_name`即将包安装的指定环境名。环境名两边不加尖括号“<>”。
2. `package_name`即要安装的包名。包名两边不加尖括号“<>”。

例如：`conda install --name python2 pandas`即在名为“python2”的环境中安装pandas包。

#### 在当前环境中安装包

```
conda install <package_name>
```

- 注意：
  1. `package_name`即要安装的包名。包名两边不加尖括号“<>”。
  2. 执行命令后在当前环境中安装包。
- 例如：`conda install pandas`即在当前环境中安装pandas包。

#### 使用pip安装包

- 使用场景

  使用`conda install`无法进行安装时，可以使用pip进行安装

  ```
  pip install <package_name>
  ```

  - 注意：<package_name>为指定安装包的名称。包名两边不加尖括号“<>”。
  - 如：`pip install see`即安装see包。

- pip只是包管理器，不能管理环境，因此如果想在指定环境中使用pip进行安装包，需要先切换到指定环境中，再使用pip命令安装包

- pip无法更新python，因为pip不把python视为包

#### 从Anaconda.org安装包

- 使用场景

  当使用`conda install`无法进行安装时，可以从anaconda.org中获取安装包的命令，并进行安装

- 从Anaconda.org安装包时，无需注册。

  在**当前环境**中安装来自于Anaconda.org的包时，需要通过输入要安装的包在Anaconda.org中的路径作为获取途径（channel）。查询路径的方式如下：

1. 在浏览器中输入：[http://anaconda.org](https://link.jianshu.com?t=http%3A%2F%2Fanaconda.org)，或直接点击[Anaconda.org](https://link.jianshu.com?t=http%3A%2F%2Fanaconda.org)
2. 在新页面“Anaconda Cloud”的上方搜索框中输入要安装的包名，然后点击右边“放大镜”标志。
3. 复制“To install this package with conda run:”下方的命令，并粘贴在终端中执行。 

### 卸载包

#### 卸载指定环境中的包

```
conda remove --name <environment_name> <package_name>

```

注意：

1. `environment_name`即卸载包所在指定环境的名称。环境名两边不加尖括号“<>”。
2. `package_name`即要卸载包的名称。包名两边不加尖括号“<>”。

例如：`conda remove --name python2 pandas`即卸载名为“python2”中的pandas包。

#### 卸载当前环境中的包

```
conda remove <package_name>

```

注意：

1. `package_name`即要卸载包的名称。包名两边不加尖括号“<>”。
2. 执行命令后即在当前环境中卸载指定包。

例如：`conda remove pandas`即在当前环境中卸载pandas包。

### 更新包

#### 更新所有包

```
conda update --all

```

```
conda upgrade --all

```

#### 更新指定包

```
conda update <package_name>

```

```
conda upgrade <package_name>

```

注意： 

1. `package_name`为指定更新的包名。包名两边不加尖括号“<>”。
2. 更新多个指定包，则包名以**空格**隔开，向后排列。如：`conda update pandas numpy matplotlib`即更新pandas、numpy、matplotlib包。

## Anaconda Navigator

是Anaconda发行版中包含的桌面图形用户界面，允许在不适用命令行的情况下启动应用程序并管理conda包，环境和通道。

Anaconda Navigator可以在Anaconda Cloud或本地Anaconda存储库中搜索包

### Home Tab

显示了可以使用Navigator管理的所有可用应用程序，包括

- Jupter Lab
- Jupter Notebook
- Qt console
- Spyder
- Vscode

### Environments Tab

允许管理已安装的环境，包和channels

![在这里插入图片描述](https://pics-1309385371.cos.ap-beijing.myqcloud.com/typora/202201/22/213649-208466.png)

 左列列出了你的环境，单击环境以激活它。右列列出了当前环境中的包。默认视图是已安装的包，要更改显示的包，请单击列表旁边的箭头，然后选择"未安装"，“可升级"或"所有包” 

### Learning Tab

了解有关Navigator，Anaconda平台和开放数据平台的更多信息

### Community Tab

了解有关Navigator相关的活动，免费支持论坛和社交网络的更多信息

### 运行代码 Jupyter Notebook

使用Spyder或者Jupyter笔记本

Jupyter可以将代码，描述性文本，输出，图像和交互式界面组合到一个笔记本文件中，可以在Web浏览器中进行编辑，查看和使用 

文档保存为后缀为`.ipynb`的`json文件`，方便进行版本控制和共享，同样可以导出为HTML，LaTeX，PDF等格式

#### 启动jupyter notebook

可以在终端中输入

```
jupyter notebook

```

浏览器会自动启动，之后再Jupyter notebook中进行的操作，都要保持终端不能关闭，否则断开与本地服务器的连接之后，就无法再Jupyter notebook中进行其他操作了

>  浏览器地址栏中默认地将会显示：`http://localhost:8888`。其中，“localhost”指的是本机，“8888”则是端口号。 

> 如果你**同时**启动了多个Jupyter Notebook，由于默认端口“8888”被占用，因此地址栏中的数字将从“8888”起，每多启动一个Jupyter Notebook数字就加1，如“8889”、“8890”……

#### 指定端口启动

自定义端口号启动jupyter notebook

```
jupyter notebook --port <port_number>

```

其中，“<port_number>”是自定义端口号，直接以数字的形式写在命令当中，数字两边不加尖括号“<>”。如：`jupyter notebook --port 9999`，即在端口号为“9999”的服务器启动Jupyter Notebook。

#### 只启动服务器不打开浏览器

如果只是想启动jupyter notebook的服务器但是不进入主页面，就无需立刻启动浏览器

```
jupyter notebook --no-browser

```

此时，将会在终端显示启动的服务器信息，并在服务器启动之后，显示出打开浏览器页面的链接。当你需要启动浏览器页面时，只需要复制链接，并粘贴在浏览器的地址栏中，轻按回车变转到了你的Jupyter Notebook页面。

![img](https://pics-1309385371.cos.ap-beijing.myqcloud.com/typora/202201/22/212549-217387.webp)

## powershell中无法进行conda activate

**之前是conda不支持powershell，conda 4.6 以上版本已经解决了这个问题。**

首先查看自己的conda版本，不够要升级一下（一定要是大写V）

```text
conda -V
```

然后在powershell中输入

```text
conda init powershell
```

如果powershell报错，一般都是Windows PowerShell 执行的默认策略“Restricted”所致。

我们可以修改安全策略为：”REMOTESIGNED“

使用管理员权限打开 powershell（就是在搜索栏搜powershell，然后右键以管理员权限打开）

修改策略代码：

```text
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```

[传送门](https://www.zhihu.com/question/58573630)

## 参考

[Anaconda介绍，安装及使用教程](https://www.jianshu.com/p/62f155eb6ac5)

