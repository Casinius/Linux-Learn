## 前沿
推荐一个shell工具fish，他能够自动补全可能的路径和开头的命令（通过Tab键展开提示列表），主要是为了避免没有安装就调用的尴尬
## 什么是virt-manager
在大多数linux发行版中都包含virt-manager，它是一个正在持续更新的QEMU虚拟机界面前端
提供点击操作的界面给新手，也允许进阶人士在设置中允许xml编辑以进一步更改不同虚拟设备的配置。(但是我们大多数时候用不到进阶功能)
## virt-manager替代
假如您确实不喜欢图形界面操作，或者想要一个命令式可复现的工具，使用quickemu，注意quickemu不带环境验证工具
## 安装
### 基于Debian的发行版
在基于debian的发行版中，例如kali，您可以通过在控制台输入sudo apt update获得软件包的索引

假如有证书错误，您可能需要到对应发行版官网的包下载页面下载keyring包，通过sudo dpkg -i ".../xxx-keyring.deb"

然后通过sudo apt install virt-manager来初步安装管理软件

部分发行版的软件包仓库也许不会把qemu作为其的关联依赖，您如果出现没有hypervisor的情况，请手动安装
sudo apt install qemu
### 基于ArchLinux的发行版
(如果后面没跟着软件包的名字的话
"S"是安装   第一个"y"是同意更新索引  第二个"y"是默认同意请求)
通过sudo pacman -Syy更新索引

(如果后面跟着软件包的名字的话
"S"是安装   第一个"y"是同意更新索引  第二个"y"是默认同意请求，如果只有一个y则是默认同意安装)

通过sudo pacman -Sy archlinux-keyring自动更新gpg验证密钥(滚动发行版要在提示时间之前更新)

sudo pacman -Sy virt-manager安装管理界面的本体

sudo pacman -Sy qemu，请选择qemu-full，或者至少选择qemu-system，它提供了硬件级别的虚拟化能力，不再需要cpu全模拟运行，运行效率大大提高

## 启动服务
init系统是linux中负责引导系统服务的组件，服务的引导发生在内核完全引导加载之后
### Systemd
Systemd是最出名也是争议最大的一个init系统，Systemd以易用 庞大周全 和 自动化闻名，通过systemctl start <服务名字> 我们可以快速启动服务，网上教程也非常多
在virt-manager这里，它依赖于libvirtd组件来拉起各种虚拟机加速需要的系统服务和组件，因此您安装完后需要执行
sudo systemctl start libvirtd.service
而上网方式您可以自行探索，如果不需要虚拟机和主机网络沟通，那么在安装过程中直接默认NAT即可，第二次启动也许会出现无法启动NAT服务的提示
sudo virsh net-start default即可

### OpenRC
以下是官方教程
https://old.calculate-linux.org/main/en/openrc_manuals

OpenRC是出于对systemd统治地位的担忧和sysV的功能简陋的不满而开发的新型init系统，它不会完成太多的自动化工作，因此多数时候，您需要检查引导启动服务的列表
https://old.calculate-linux.org/main/en/rc-status
通过rc-status -a -r -s等选项来查看

rc-update add service_name runlevel
runlevel有default等

gentoo提供了更加友好的wiki来帮助您学习
https://wiki.gentoo.org/wiki/OpenRC
**关于virt服务**
https://wiki.gentoo.org/wiki/Libvirt
启动服务方式
rc-service libvirtd start && rc-update add libvirtd default