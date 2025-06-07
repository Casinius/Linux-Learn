## 架构图
![[Drawing 2025-06-07 21.38.35.excalidraw.svg]]## Linux容器技术
### NameSpace技术
从Linux2.6内核版本开始，Linux加入一项非常有用的内核技术，NameSpace，它可以虚拟化出很多东西，具体看图
#### ControlGroup
CGroup技术同样支持NameSpace技术，因此可以虚拟化出另一套硬件利用率配置，来给容器使用

### 内外交互
通过挂载容器对应设备目录到某些目录可以实现共享写入，现在一些非特权容器就是通过这个方法可以运行GUI软件
## 容器管理软件
### 容器管理软件体系
#### Docker系
Docker是首先利用了这些技术的项目，它本身是闭源的，但是母公司想要垄断标准，所以在容器标准委员会敦促下开源了Containerd运行时和Docker，而更高级的管理比如Docker-Compose就不开源（要赚钱的嘛.jpg）
##### 中间件
Docker-Shim，疑似是开源的
##### 底层运行时
Containerd，一个比较强大的运行时
#### Podman系
Podman是完全开源的，它兼容docker的文件系统包格式，而且还提供非特权容器选择，因此深受社区青睐，近年来发展神速
##### 中间件
LibPod，完全开源
##### 底层运行时
1.RunC 是根据docker开源组件延续维护的运行时，使用go编写
2.Crun 是用C语言重写的Native开源底层运行时组件，效率很高