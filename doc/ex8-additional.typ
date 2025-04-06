+ 尝试使用areas[0] = 100;以及相似的操作对areas的元素赋值。
见excise/ex8/ex8-broken.c

+ 尝试对name和full_name的元素赋值。
见excise/ex8/ex8-broken.c

+ 尝试将areas的一个元素赋值为name中的字符。
见excise/ex8/ex8-broken.c

+ 上网搜索在不同的CPU上整数所占的不同大小。

	- 16位系统：int通常为2字节（范围-32768~32767）
	- 32位系统：int通常为4字节（范围-2^31~2^31-1）
	- 64位系统：
	- Windows：int仍为4字节，long为4字节
	- Linux/Unix：long为8字节，但int保持4字节
	- 嵌入式系统：如8051单片机，int可能为2字节（C标准允许的最小值）

验证方法：

使用sizeof(int)查看当前平台的整数大小。
参考<stdint.h>中的int32_t和int64_t确保跨平台兼容性 
