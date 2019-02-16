/******************************************************************************
 * 1.创建结构体类型,为创建结构体变量做准备
 * 2.创建一个链表的头，但不存放有效数据[此时已创建了一个结构体变量]
 * 3.创建新节点，为链表在插入做准备
 * 4.链表节点插入
 * 5.链表节点的遍历
 */
#include <stdio.h>
#include <stdlib.h>

/* 创建一个结构体类型，它有2个成员 */
struct node {
	int data;
	struct node *next;
};

/* 创建一个链表的头 */
struct node *create_list_head()
{
	/* head 成了结构体变量 */
	struct node *head = (struct node *)malloc(sizeof(struct node));
	head->next = NULL;
	return head;
}

/* 创建一个新节点 */
struct node *create_node_new(int data)
{
	struct node *new = (struct node *)malloc(sizeof(struct node));
	new->data = data;
	new->next = NULL;
	return new;
}

/* 插入节点位置，参数：插入那个节点，插入节点的数据 */
void insert_node_head(struct node *head, int data)
{
	struct node *new = create_node_new(data);
	new->next = head->next;
	head->next = new;
}

/* 打印节点内容 */
void print_list(struct node *head)
{
	struct node *traversal = head->next;
	while (traversal)
	{
		printf("%d,", traversal->data);
		traversal = traversal->next;
	}
	printf("\n");
}


int main(void)
{
	struct node *list = create_list_head();
	insert_node_head(list, 1);
	insert_node_head(list, 2);
	insert_node_head(list, 3);
	insert_node_head(list, 4);
	print_list(list);
	return 0;
}



