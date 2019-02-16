/*
归并排序也称合并排序，其算法思想是将待排序序列分为两部分，
依次对分得的两个部分再次使用归并排序，之后再对其进行合并。

仅从算法思想上了解归并排序会觉得很抽象，
接下来就以对序列A[0], A[l]…, A[n-1]进行升序排列来进行讲解，
在此采用自顶向下的实现方法，操作步骤如下。

(1)将所要进行的排序序列分为左右两个部分，
如果要进行排序的序列的起始元素下标为first，
最后一个元素的下标为last，
那么左右两部分之间的临界点下标mid=(first+last)/2，
这两部分分别是A[first … mid]和A[mid+1 … last]。

(2)将上面所分得的两部分序列继续按照步骤(1)继续进行划分，直到划分的区间长度为1。

(3)将划分结束后的序列进行归并排序，排序方法为对所分的n个子序列进行两两合并，
得到n/2或n/2+l个含有两个元素的子序列，再对得到的子序列进行合并，
直至得到一个长度为n的有序序列为止。下面通过一段代码来看如何实现归并排序。
*/



#include <stdio.h>
#include <stdlib.h>
void division(int arr[], int left, int right);
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



void division(int arr[], int left, int right)
{
    if (left == right)
        return;
    else
    {
        int mid = (left + right)/2;
        division(arr, left, right);
        division(arr, mid+1, right);
        merge(arr, left, mid+1, right);
    }
}


int main(void)
{
    int arr[] = {2,8,9,10,4,5,6,7};
    int left = 0;
    int right = 7;
    int i;
    division(arr, left, right);
    printf("hello world\n");
    for (i=0; i<=right; i++)
        printf("%d,", arr[i]);
    return 0;
}

