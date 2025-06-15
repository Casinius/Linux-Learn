## BIOS芯片是什么
现代的BIOS芯片实际上就是一片单片机，它包含了通用的处理核心 寄存器和SRAM，SRAM容量很小，可以直接访问，耗时很短，而他们都会配备一颗烧录了固定程序的ROM（实际上就是类似固态硬盘的颗粒，但是不需要主控，因为容量很小）

一些嵌入式设备的BIOS芯片可能只会有寄存器，只能访问ROM，这些需要你们开发stm32单品机的时候去看看江科大的教程来学了

## BIOS是做什么的
ROM里面储存的BIOS程序是一段二进制程序，用C语言的方式表达就是
当某个硬件准备好之后，就会往某个物理的线上发送数字信号，而数字信号会被映射成某个变量（实际上是寄存器变量）
BIOS程序只需要按照规范读取这些变量，按照这些硬件的文档规范所写的条件，来检查其是否初始化正常
然后BIOS会初始化另一些设备（比方说刚才提到的SRAM），加载ROM里面的标准化固件到SRAM里面并且执行它们

然后**这些标准化的固件程序会引导内核**

固件标准有
UEFI/BIOS （通常会搭配ACPI标准，因为Win和Linux还有BSD的内核都支持读取ACPI表来读取硬件的地址）（X86目前普遍已经实现，但是部分x86设备不一定支持ACPI，因此能够运行EFI程序和能够自动化读取硬件地址是两回事）（这种不支持ACPI的，就只能通过内核设计的方法提交硬件地址（Linux内核就是DeviceTree，Win的NT内核不支持任何其他提交方式，只支持ACPI））
Video BIOS
Open  Firmware （主要是PowerPC架构在用）
ACPI （大多数X86设备已经普及，Arm目前还停留在UEFI推广阶段，只有部分服务器有ACPI+UEFI双标准固件（其实现叫做EDK2））
APM
AlphaBIOS
SRM
SFI


固件标准的代码实现有（编译出来就是标准化的固件程序了）
SeaBIOS
Award BIOS
American Megatrends
OpenBIOS
Coreboot （Intel cpu的ChromeBook在用）
InsydeH2O
LinuxBoot （即外置一个芯片存一个超小型linux，写好DeviceTree用这个固定编译好的内核去Kexec热更新启动其他Linux内核）
Libreboot （仅支持TinkPadX210等老笔记本）
Kickstart
Run-Time Abstraction Services