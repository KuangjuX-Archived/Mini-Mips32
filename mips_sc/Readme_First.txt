包含build和src文件夹，convert.c，default.ld， Makefile文件。

目录结构：
   +--build/        		: 中间结果和最终文件保存目录
   |        
   |--src/			: 测试汇编源程序
   |
   |--convert.c			: 转化文件，将编译生成的二进制代码转化为Logisim能够使用的raw文件和Vivado工程能够直接使用的coe文件
   |
   |--default.ld		: 编译链接脚本
   |
   |--Makefile			: make脚本