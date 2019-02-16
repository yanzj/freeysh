#include "common.h"

int main(void)
{
	int i;
	int a[] = {9, 8, 7, 6, 5, 4, 3, 2, 1, 0};
	select_sort(a, 10);
	for (i = 0; i < 10; i++)
		printf("%d ", a[i]);
	printf("\n");
	return 0;
}
