#import "../template.typ": *
#show: CJK_set
#show: formal_text

podman文档：#link("https://docs.podman.org.cn/en/latest/markdown/podman.1.html")

#centerize[
  #H2[
    Distrobox不支持的小众平台？
  ]
]
您也许会遇到类似Miips riscv等小众架构，而恰好他们使用uboot而且没有UEFI，恰好他们的版本很旧，恰好他们的RootFs不是Gentoo
并且，如果按照live安装的Devuan而不是通过Pepermint安装或者Devuan安装镜像安装，则用非Root容器很大可能会出现映射失败
#centerize[
  #H3[
    提示
  ]
]
用Root账户和普通账户运行Podman的结果是不同的，通常有些容器是Systemd作为init，有时候在非Systemd发行版上面会缺乏映射表，要不自己补全映射表，要不用Root账户运行，值得注意的是Root账户有一定风险

有些发行版本的根目录不是share mount有时候也会引发一些问题

Podman的容器本身被叫做pod

#centerize[
  #H3[
    Podman和Docker兼容性
  ]
]
docker的大部分的命令podman都可以兼容，所以无需担心

#centerize[
  #H3[
    Podman命令
  ]
  #small_formal_text[
    #table(
      columns: (auto, auto, auto),
      inset: 10pt,
      align: horizon,
      [命令], [参数], [作用],



      "podman pull", "<镜像地址>", "拉取镜像本地缓存",

      "podman ps", "", "查看正在运行的镜像
    -a 则是查看全部容器
    ",



      "podman pod create",
      "无",
      "创建一个空pod
    无参数下没有实际作用，创建一个空的容器而已，主要是用于后期Compose（基于某个镜像自定义设置和组件）

    如果你喜欢分步的话

    那先create完
    然后podman pod list看名字

    最后
    podman commit <pod名字> <镜像名字>
    ",


      "podman run",
      "
     <-d 解绑方式>
     <-it 可互动>
     <-p 端口映射>
     <--name 名字>
     镜像名字
     <shell 就是控制台比如bash或者zsh或者fish>",
      "直接运行容器
      -d是detach，会使得-it失效
      -i是可互动，意思是开放stdin到此终端
      -t是persudo-tty，开一个伪装tty到本终端
      并且需要在最后指定/bin/bash",

      "podman build", "
    -f <Compose镜像文件配置目录>
    -t <镜像名字>
    <目录context>", "建造属于自己的镜像",
    


    "podman port -l",
    "",
    "查看开放映射的端口",


    "podman rm <pod名字>",
    "",
    "删除容器",



    "podman stop <pod名字>",
    "",
    "停止容器",
    )
  ]

]
