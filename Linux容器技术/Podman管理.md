podman文档：[https://docs.podman.org.cn/en/latest/markdown/podman.1.html](https://docs.podman.org.cn/en/latest/markdown/podman.1.html)

## **Distrobox不支持的小众平台？**

您也许会遇到类似Miips riscv等小众架构，而恰好他们使用uboot而且没有UEFI，恰好他们的版本很旧，恰好他们的RootFs不是Gentoo 并且，如果按照live安装的Devuan而不是通过Pepermint安装或者Devuan安装镜像安装，则用非Root容器很大可能会出现映射失败

### **提示**

用Root账户和普通账户运行Podman的结果是不同的，通常有些容器是Systemd作为init，有时候在非Systemd发行版上面会缺乏映射表，要不自己补全映射表，要不用Root账户运行，值得注意的是Root账户有一定风险

有些发行版本的根目录不是share mount有时候也会引发一些问题

Podman的容器本身被叫做pod

### **Podman和Docker兼容性**

docker的大部分的命令podman都可以兼容，所以无需担心

### **Podman命令**

| 命令                    | 参数                                                                                                                              | 作用                                                                                                                                                                       |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| podman pull           | \<镜像地址\>                                                                                                                        | 拉取镜像本地缓存                                                                                                                                                                 |
| podman ps             |                                                                                                                                 | 查看正在运行的镜像                                                                                                                                                                |
| podman pod create     | 无                                                                                                                               | 创建一个空pod \| 无参数下没有实际作用，创建一个空的容器而已，主要是用于后期Compose（基于某个镜像自定义设置和组件) \|  如果你喜欢分步的话 \|  那先create完<br>    然后podman pod list看名字  \|  最后<br>    podman commit \<pod名字\> \<镜像名字\> |
|                       |                                                                                                                                 |                                                                                                                                                                          |
| podman run            | \<-d 解绑方式\><br>     \<-it 可互动\><br>     \<-p 端口映射\><br>     \<--name 名字\><br>     镜像名字<br>     \<shell 就是控制台比如bash或者zsh或者fish\> | 直接运行容器<br>      -d是detach，会使得-it失效<br>      -i是可互动，意思是开放stdin到此终端<br>      -t是persudo-tty，开一个伪装tty到本终端<br>      并且需要在最后指定/bin/bash                                       |
| podman build          | -f \<Compose镜像文件配置目录\><br>    -t \<镜像名字\><br>    \<目录context\>                                                                  | 建造属于自己的镜像                                                                                                                                                                |
| podman port -l        |                                                                                                                                 | 查看开放映射的端口                                                                                                                                                                |
| podman rm \<pod名字\>   |                                                                                                                                 | 删除容器                                                                                                                                                                     |
| podman stop \<pod名字\> |                                                                                                                                 | 停止容器                                                                                                                                                                     |
