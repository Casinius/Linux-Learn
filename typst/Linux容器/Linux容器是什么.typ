#import "../template.typ": *
#show: CJK_set
#centerize[
  #H3[
    架构图
  ]
  #image("Drawing 2025-06-07 21.38.35.excalidraw.svg")
]
#centerize[
  #H3[
    Linux容器技术
  ]
]


#centerize[
  #H4[
    NameSpace技术
  ]
]

#formal_text[
  从Linux2.6内核版本开始，Linux加入一项非常有用的内核技术，NameSpace，它可以虚拟化出很多东西，具体看上图
  Namespace也会在/dev里面创建设备
]

#centerize[
  #H4[
    ControlGroup技术
  ]
]
#formal_text[
  CGroup是一套虚拟的用户映射表技术，在Linux一切都是文件，这些文件通过组ID来管理访问权限，而通过CGroup模拟全套映射，就可以把外部的设备文件映射到内部，并且组映射到外部组，内部的应用访问内部对应设备就会被转发到外部

  这也就意味着，CGroup技术同样支持NameSpace技术，因此可以虚拟化出另一套硬件利用率配置，来给容器使用
]
#centerize[
  #H4[
    内外交互
  ]
]
#formal_text[
  通过挂载容器对应设备目录到某些目录可以实现共享写入，现在一些非特权容器就是通过这个方法可以运行GUI软件
]
#centerize[
  #H3[
    容器管理软件
  ]
]

#centerize[
  #H4[
    容器管理软件体系
  ]
  #H5[
    Docker系
  ]
]
#formal_text[
  Docker是首先利用了这些技术的项目，它本身是闭源的，但是母公司想要垄断标准，所以在容器标准委员会敦促下开源了Containerd运行时和Docker，而更高级的管理比如Docker-Compose就不开源（要赚钱的嘛.jpg）
]

#centerize[
  #H6[
    中间件
  ]
]
#formal_text[
  Docker-Shim，疑似是开源的
]
#centerize[
  #H6[
    底层运行时
  ]
]
#formal_text[
  Containerd，一个比较强大的运行时
]



#centerize[
  #H5[
    Podman系
  ]
]
#formal_text[
  Podman是完全开源的，它兼容docker的文件系统包格式，而且还提供非特权容器选择，因此深受社区青睐，近年来发展神速
  不过据说有一些bug，但是修复很快，目前以非Root容器闻名
]
#centerize[
  #H6[
    中间件
  ]
]
#formal_text[
  LibPod，完全开源
]
#centerize[
  #H6[
    底层运行时
  ]
]
#formal_text[
  + RunC 是根据Docker开源组件延续维护的运行时，使用Go编写
  + Crun 是用C语言重写的Native开源底层运行时组件，效率很高
]
