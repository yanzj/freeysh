#include <stdio.h>
int div(int a, int b, int *result);
int main()
{
	int a = 5;
	int b = 6;
	printf("----- input 2 number -----\n");
	scanf("%d%d", &a, &b);
	int c;
	if (div(a, b, &c)) {
		printf("%d/%d=%d\n", a, b, c);
	}
		
	return 0;
}
int div(int a, int b, int *result)
{
	int ret = 1;
	if (b == 0) {
		ret = 0;
	}
	else {
		*result = a/b;
	}
	printf("hello,world\n");
	return ret;
}
