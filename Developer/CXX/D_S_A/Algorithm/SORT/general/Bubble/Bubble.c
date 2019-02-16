
void bubble_sort(int arr, int n)
{
	int i, j, temp, flag;
	for (i = n-1; i >= 1; --i)
	{
		flag = 0;
		for (j = 1; j <= i; ++j)
		{
			if (arr[j-1] > arr[j])
			{
				temp = arr[j];
				arr[j] = arr[j-1];
				arr[j-1] = temp;

				flag = 1;
			}
		if (flag == 0)
			return;
		}
	}
}
