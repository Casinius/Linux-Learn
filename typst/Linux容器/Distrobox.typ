#import "../template.typ": *

#show: CJK_set

#centerize[
  #H2[
    Distrobox简介及优缺点
  ]
]

#formal_text[
  Distrobox是Podman和Docker的前端
  优点：
  - 提供一条命令启动，自动挂载相关目录，开箱即用的体验
  - 管理非常方便
  - 提供了systemd-nspawn等等特殊init的连接功能
  - 运行GUI程序比LXC等方便很多，特别是非Root模式下没有权限安全问题
  可能的缺点
  - 需要一定的网络条件
  - 需要focus窗口否则可能创建容器失败（下载有点慢）
]


#centerize[
  #H2[
    Distrobox使用说明
  ]

  #H3[
    Root模式 （privileged权限容器）
  ]
]

#formal_text[
  在指令后面加上--root即可
]
#centerize[
  #H3[
    非Root模式或通用命令
  ]
]
#small_formal_text[
  以下是常用的distrobox命令及其参数解释
  #table(
    columns:(auto,auto,auto),
    inset: 10pt,
    align: horizon,
    [命令],[参数],[作用],
    "distrobox create",
    "-i <镜像地址> -n <名字>",
    "创建一个叫<名字>的<镜像地址>镜像",
    
    "distrobox stop",
   "<名字>",
   "停止运行容器（会强制终止内部任何程序）",

   "distrobox ls",
   "",
   "展示当前的所有容器（需要看特权容器加--root）",

   "distrobox rm",
   "<名字>",
   "删除这个容器（但是不会删除镜像缓存）",

   "distrobox upgrade",
   "<名字>",
   "升级容器设施（相当于重新安装他的一些辅助套件，可能会重新下载不建议随便用）",
  )
]
#centerize[
  #H3[
    代理地址设定
  ]
]

#formal_text[
  export HTTP=\<代理地址\>

  export HTTPS=\<代理地址\>

  注: '\\' 是先后执行(换行)   '&&'是同时执行
]