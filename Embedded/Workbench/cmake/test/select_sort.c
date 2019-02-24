#include "select_sort.h"
void select_sort(int *ptr, int len)
{
	int i, j, k, tmp;
	for (i = 0; i < len-1; i++)
	{
		k = i;
		for (j = i+1; j < len; j++)
		{
			if (ptr[j] < ptr[k])
				k = j;
		}
		if (k != i)
		{
			tmp = ptr[i];
			ptr[i] = ptr[k];
			ptr[k] = tmp;
		}
	}
}

