#include<stdio.h>

int main(int argc, char *argv[])
{
	puts("Hello world.");

	// %[标志][宽度][.精度][长度修饰符]格式说明符

	// 整数格式
	int val = 42;
	printf("十进制: %d\n", val);        // 42
	printf("八进制: %#o\n", val);       // 052
	printf("十六进制: %#04x\n", val);   // 0x2a
	printf("科学计数: %e\n", (double)val); // 4.200000e+01

	// 浮点数控制
	double pi = 3.141592653589793;
	printf("默认: %f\n", pi);          // 3.141593
	printf("指数: %.3e\n", pi);        // 3.142e+00
	printf("智能选择: %g\n", 0.0000123); // 1.23e-05
	printf("十六进制浮点: %a\n", pi);   // 0x1.921fb54442d18p+1

	// 动态宽度与精度
	int width = 8, prec = 3;
	printf("|%*.*f|\n", width, prec, pi); // |   3.142|

	// 指针地址
	int arr[5];
	printf("数组地址: %p\n", (void*)arr);  // 0x7ffeeb39d810

	//  内存查看
	int num = 0xDEADBEEF;
	printf("内存布局: ");
	for(size_t i=0; i<sizeof(num); i++)
		printf("%02X ", ((unsigned char*)&num)[i]);
	// 输出: EF BE AD DE (小端)
	printf("\n");

	// %n 的特殊用途
	int count;
printf("Hello%n World\n", &count);
printf("已写入字符数: %d\n", count); // 5

	// 截断与填充
	char str[] = "HelloWorld";
printf("截断: %.5s\n", str);      // Hello
printf("右对齐: %10.5s\n", str);  //      Hello

	return 0;
}
