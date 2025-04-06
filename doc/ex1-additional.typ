在C语言中，如果调用一个未声明的函数，编译器会假定该函数返回`int`类型，并且参数类型由实际调用时的参数推导。这种隐式声明在C99标准之前是允许的，但会引发警告。从C99标准开始，隐式函数声明被移除，因此现代编译器（如GCC）默认会将其视为错误，尤其是在使用较新的标准或严格的编译选项时。

所以,应该先添加```c include<stdio.h>```,才能编译成功.

+ 在你的文本编辑器中打开ex1文件，随机修改或删除一部分，之后运行它看看发生了什么。

```c
// 原始正确代码
#include <stdio.h>

int m345t6u7ip0-[=]=p08<F8>75<F4><F3><F2>ain(int argc, char *argv[])
{
    puts("Hello world.");
    return 0;
}
```

	+ 删除头文件
```c
// 删除 #include 语句
int main(int argc, char *argv[])
{
    puts("Hello world.");
    return 0;
}
```
```bash
$ make ex1
cc     ex1.c   -o ex1
ex1.c: In function ‘main’:
ex1.c:4:5: warning: implicit declaration of function ‘puts’ [-Wimplicit-function-declaration]
    4 |     puts("Hello world.");
      |     ^~~~
```

	+ 修改函数返回类型
```c
#include <stdio.h>

void main(int argc, char *argv[]) // 错误返回类型
{
    puts("Hello world.");
    return 0;
}
```
```bash
$ make ex1
cc     ex1.c   -o ex1
ex1.c:5:12: error: ‘return’ with a value in function returning void
    5 |     return 0;
      |            ^
```

	+ 破坏字符串语法
```c
#include <stdio.h>

int main(int argc, char *argv[])
{
    puts("Hello world.); // 缺少闭合引号
    return 0;
}
```
```bash
$ make ex1
cc     ex1.c   -o ex1
ex1.c: In function ‘main’:
ex1.c:5:25: error: missing terminating " character
    5 |     puts("Hello world.);
      |                         ^
```

+ 再多打印5行文本或者其它比"Hello world."更复杂的东西。
见ex1-additional.c

+ 执行man 3 puts来阅读这个函数和其它函数的文档。
执行命令：
```bash
$ man 3 puts
```

 关键手册内容解读：
```c
// 函数原型
int puts(const char *s);

// 参数说明：
// s - 要输出的字符串，必须以空字符('\0')结尾

// 返回值：
// 成功时返回非负值，失败时返回EOF

// 特别注意：
// puts会自动在输出后添加换行符
// 与printf不同，不能进行格式化输出
```


1. 字符串处理函数家族
   - `puts` vs `fputs`
   - `printf` vs `fprintf`
   - 安全版本 `puts_s` (C11)

2. 缓冲区原理
   ```c
   setbuf(stdout, NULL); // 禁用缓冲
   puts("立即输出");
   ```

3. 国际化和本地化
   ```c
   #include <locale.h>
   setlocale(LC_ALL, "");
   puts("中文测试"); // 需要终端支持UTF-8
   ```
