+ 创建目标all:ex1，可以以单个命令make构建ex1
见excise/ex2/Makefile

+ 阅读man make来了解关于如何执行它的更多信息。
执行命令：
```bash
$ man make 
```
变量传递：通过CFLAGS等环境变量控制编译选项（如make CFLAGS="-O2"）。
隐式规则：Makefile 自动推导如何从.c生成.o和可执行文件。
伪目标：用.PHONY声明非文件目标（如clean）。
示例命令：make -n（模拟执行）、make -B（强制重建）

+ 阅读man cc来了解关于-Wall和-g行为的更多信息。
执行命令：
```bash
$ man cc 
```
-Wall：启用所有警告。
-g：生成调试信息（配合 GDB 使用）。
-O2：优化代码性能。
-Iinclude：指定头文件目录。
调试工具：-fsanitize=address（检测内存错误）
。

+ 在互联网上搜索Makefile文件，看看你是否能改进你的文件。
以YSYX Project为例.

+ 在另一个C语言项目中找到Makefile文件，并且尝试理解它做了什么 
以YSYX Project为例.
