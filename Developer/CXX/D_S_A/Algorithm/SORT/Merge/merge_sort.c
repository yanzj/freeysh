#include <stdio.h>
#include <stdlib.h>
void merge(int arr[], int left, int mid, int right);

void merge(int arr[], int left, int mid, int right)
{
    int left_size = mid-left;
    int right_size = right-mid+1;
    int left_array[left_size];
    int right_array[right_size];
    int i, j, k;

    //填上左边的数组元素
    for (i=left; i<mid; i++)
        left_array[i-left] = arr[i];

    //填上右边的数组元素
    for (i=mid; i<=right; i++)
        right_array[i-mid] = arr[i];

//测试 ==========================================================================
    for (i=0; i<left_size; i++)
        printf("%d,", left_array[i]);
    printf("\n");
    printf("test Left program finish !!!\n");

    for (i=0; i<right_size; i++)
        printf("%d,", right_array[i]);
    printf("\n");
    printf("test Right program finish !!!\n");

//测试 Finish ===================================================================


    //把两个数组合并成一个数组
    i = 0; j = 0; k = 0;
    while (i<left_size && j<right_size)
    {
        if (left_array[i] < right_array[j])
        {
            arr[k] = left_array[i];
            i++;
            k++;
        }
        else
        {
            arr[k] = right_array[j];
            j++;
            k++;
        }
    }

//其它情况，直接把左边的数组或右边的数组，直接复制到新的数组中
    while (i < left_size)
    {
        arr[k] = left_array[i];
        i++;
        k++;
    }
    while (j < right_size)
    {
        arr[k] = right_array[j];
        j++;
        k++;
    }
}

int main(void)
{
    int arr[] = {2,8,9,10,4,5,6,7};
    int left = 0;
    int mid = 4;
    int right = 7;
    int i;
    merge(arr, left, mid, right);
    for (i=0; i<=right; i++)
        printf("%d,", arr[i]);
    printf("\n");
    return 0;
}


