## distrobox不支持的小众平台？
您也许会遇到类似Miips riscv等小众架构，而恰好他们使用uboot而且没有UEFI，恰好他们的版本很旧，恰好他们的rootfs不是Gentoo


### 提示
用root账户和普通账户运行podman的结果是不同的，通常有些容器是systemd作为init，有时候在非systemd发行版上面会缺乏映射表，要不自己补全映射表，要不用root账户运行，值得注意的是root账户有一定风险

有些发行版本的根目录不是share mount有时候也会引发一些问题

podman的容器本身被叫做pod

### podman和docker兼容性
docker的大部分的命令podman都可以兼容，所以无需担心
## 拉取镜像

podman pull <镜像地址>

## 查看正在运行的镜像
podman ps
## 创建
podman pod create 
无参数下没有实际作用，创建一个空的容器而已，主要是用于后期Compose（基于某个镜像自定义设置和组件）

如果你喜欢分步的话

那先create完
然后podman pod list看名字
然后
podman commit <pod名字> <镜像名字>
## 运行+创建一体
podman run <-d 后台挂着> <-it 可互动> <--name 名字> 镜像名字 <shell 就是控制台比如bash或者zsh或者fish>
## 停止
podman stop <pod名字>
## 删除
podman rm <pod名字>

## 挂载神秘储存设备
创建pod的时候加--volume
