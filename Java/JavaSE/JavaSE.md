# JavaSE教程

笔记整理来源：

1. [黑马程序员Java零基础视频教程(2022最新Java入门，含斯坦福大学练习题+力扣算法题+大厂java面试题）](https://www.bilibili.com/video/BV17F411T7Ao)



## 人机交互

### 什么是cmd

就是在windows操作系统中，利用命令行的方式去操作计算机。

我们可以利用cmd命令去操作计算机，比如：打开文件，打开文件夹，创建文件夹等。

### 常用CMD命令

| 操作               | 说明                              |
| :----------------- | :-------------------------------- |
| 盘符名称:          | 盘符切换。E:回车，表示切换到E盘。 |
| dir                | 查看当前路径下的内容。            |
| cd 目录            | 进入单级目录。cd itheima          |
| cd ..              | 回退到上一级目录。                |
| cd 目录1\目录2\... | 进入多级目录。cd itheima\JavaSE   |
| cd \               | 回退到盘符目录。                  |
| cls                | 清屏。                            |
| exit               | 退出命令提示符窗口。              |

### 环境变量

**为什么要配置**

开发Java程序，需要使用JDK提供的开发工具（比如javac.exe、java.exe等命令），而这些工具在JDK的安装目录的bin目录下，如果不配置环境变量，那么这些命令只可以在bin目录下使用，而我们想要在任意目录下都能使用，所以就要配置环境变量。

在启动软件的时候，操作系统会先在当前路径下找，如果当前路径没有，再到环境变量的路径中去找。如果都找不到就提示无法启动。

注意：现在最新从官网上下载的JDK安装时会自动配置javac、java命令的路径到Path环境变量中去 ，所以javac、java可以直接使用。

**步骤**：

- 右键我的电脑，选择属性。
- 点击左侧的高级系统设置
- 选择高级，再点击下面的环境变量。
- 找系统变量里面的PATH
- 把软件的完整路径，配置到PATH当中就可以了。
- （可做可不做）就是把自己配置的路径，移动到最上面。

## Java概述

### Java是什么

语言：人与人交流沟通的表达方式

计算机语言：人与计算机之间进行信息交流沟通的一种特殊语言

Java是一门非常火的计算机语言。（也叫做编程语言）

我们想要让计算机做一些事情，那么就可以通过Java语言告诉计算机就可以了

### 下载和安装

**下载**：通过官方网站获取JDK

[http://www.oracle.com](http://www.oracle.com/)

注意1：针对不同的操作系统，需要下载对应版本的JDK。

注意2：

​	如果你的电脑是windows32位的，建议重装系统，重装成64位的操作系统。

​	因为Java从9版本开始，就已经不提供32位版本的安装包了。

**安装**：

- 安装路径不要有中文，不要有空格等一些特殊的符号。
- 以后跟开发相关的所有软件建议都安装在同一个文件夹中，方便管理。

**jdk目录介绍**

| 目录名称 | 说明                                                         |
| -------- | ------------------------------------------------------------ |
| bin      | 该路径下存放了JDK的各种工具命令。javac和java就放在这个目录。 |
| conf     | 该路径下存放了JDK的相关配置文件。                            |
| include  | 该路径下存放了一些平台特定的头文件。                         |
| jmods    | 该路径下存放了JDK的各种模块。                                |
| legal    | 该路径下存放了JDK各模块的授权文档。                          |
| lib      | 该路径下存放了JDK工具的一些补充JAR包。                       |
