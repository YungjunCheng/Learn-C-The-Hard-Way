+ 把为universe_of_defects赋值的数改为不同的大小，观察编译器的警告。
打开ex7.c文件，找到原代码：

```C long universe_of_defects = 1L * 1024L * 1024L * 1024L;```

修改乘数使其超出long范围（例如扩大为 2^31）：

```C long universe_of_defects = 1L * 1024L * 1024L * 1024L * 1024L;```

```bash
gcc ex7.c -o ex7
ex7.c: In function ‘main’:
ex7.c:11:85: warning: integer overflow in expression of type ‘long int’ results in ‘0’ [-Woverflow]
   11 |  universe_of_defects = 1L * 1024L * 1024L * 1024L *  1024L * 1024L *  1024L *  1024L;
      |                                                                             ^
```
long类型在32位系统中最大为2^31-1（2147483647），超出会导致溢出.

+ 这些巨大的数字实际上打印成了什么？
输出可能为负值（如-2147483648）或0.

+ 将long改为unsigned long，并试着找到对它来说太大的数字。
```c printf("Max unsigned long: %lu\n", ULONG_MAX);```
    需要包含头文件```c #include <limits.h>```

结果：在64位系统中unsigned long最大为18446744073709551615UL。

+ 上网搜索unsigned做了什么。

    unsigned表示无符号整数，范围从0开始（如unsigned int范围是0~4294967295）。
    适用场景：当数值不需要负数时，可扩大正数存储范围。

+ 试着自己解释（在下个练习之前）为什么char可以和int相乘。
	1. 字符的本质是整数

    char nul_byte = '\0';
        '\0'是空字符（ASCII值为0）。
        在C语言中，char类型实际存储的是整数值（ASCII编码），因此nul_byte的值是整数0。

	2. 隐式类型转换

    int care_percentage = bugs * nul_byte;
        bugs是int类型（值为100），nul_byte是char类型（值为0）。
        在算术运算中，C语言会将较小的类型（如char）自动提升为int类型。
        因此，实际运算为：100 * 0 = 0。

	3. 输出结果的逻辑

    printf("Which means you should care %d%%.\n", care_percentage);
        care_percentage的值为0，因此输出0%。

