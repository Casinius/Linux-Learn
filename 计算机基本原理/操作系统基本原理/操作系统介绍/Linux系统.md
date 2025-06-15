## 组成
### 内核
Linux内核是Linux系统的核心，并且Linux非常模块化
> 已经在内核部分介绍过

### 基本工具套件
基本的访问输出命令处理等等套件可以换掉，目前主流的套件是GNU bin_utils（包括我们熟知的ls cd awk sed等等的套件都属于GNU的二进制套件）
所以包括这些套件的大多数Linux发行版就叫做GNU/Linux
当然也有不用GNU套件的，比如说AlpineLinux就是用的是BusyBox（BusyBox也实现了ls cd等等功能）
### 运行时
大多数软件都依赖C运行库，甚至Rust标准库也是，这是计算机行业长期发展的结果（Windows也有自己实现的C运行时，2019年之前是msvcrt，2019年之后叫ucrtbase）
而C标准虽然只有一个
但是实现有很多
最有名的包括Glibc和MuslC（也叫ulibc）
而前者是大多数Linux原生软件动态依赖的运行时
依赖MuslC的软件很少，但是也有上千个，AlpineLinux和VoidLinux的Musl版本就是使用muslc作为其运行时