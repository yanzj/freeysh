### ===========================================================================
make的特殊变量，自动化变量
	$<	第一个依赖文件的名称
	$^	所有的依赖文件，以空格分开，不包含重复依赖的文件
	$@	目标文件的名称

	
Makefile 语法规则

target:   dependencies ...
          commands
          ...



### ===========================================================================
make_example 1 ------------>make -f makefile_v1
注意：.PHONY后面都是伪目标

main: main.o add.o sub.o
	gcc -Wall -g main.o add.o sub.o -o main
main.o: main.c
	gcc -Wall -g main.c -o main.o
add.o: add.c
	gcc -Wall -g add.c -o add.o
sub.o: sub.c 
	gcc -Wall -g sub.c -o sub.o

.PHONY: clean
clean:
	rm -f main main.o add.o sub.o




### ===========================================================================
make_example 2             makefile
自定义变量使用规则 && make的自动化变量使用规则 

OBJ=main.o add.o sub.o
main: $(OBJ)
	gcc -Wall -g $^ -o $@
main.o: main.c
	gcc -Wall -g $< -o $@
add.o: add.c
	gcc -Wall -g $< -o $@
sub.o: sub.c 
	gcc -Wall -g $< -o $@

.PHONY: clean
clean:
	rm -f main $(OBJ)




### ===========================================================================
make_example 3             makefile自动推导规则
touch 01test.c 02test.c
01test/01test.c,        02test/02test.c
编译多个可执行文件，并且用自动推导规则



.PHONY clean all
BIN=01test 02test
all: $(BIN)

clean: 
	rm -f $(BIN)


### ===========================================================================
make_example 3.1            makefile自动推导规则
touch 01test.c 02test.c
01test.c--->01test     02test.c--->02test
编译多个可执行文件


.PHONY clean all
BIN=01test 02test
all: $(BIN)
01test: 01test.o
	gcc -Wall -g $^ -o $@
02test: 02test.o
	gcc -Wall -g $^ -o $@

clean: 
	rm -f $(BIN)




### ===========================================================================
make_example 3.2           makefile
1    %.o: %.c              模式规则
touch 01test.c 02test.c
01test.c--->01test     02test.c--->02test
编译多个可执行文件

.PHONY clean all
BIN=01test 02test
all: $(BIN)

%.o: %.c
	gcc -Wall -g -c $< -o $@

01test: 01test.o
	gcc -Wall -g $^ -o $@
02test: 02test.o
	gcc -Wall -g $^ -o $@

clean: 
	rm -f $(BIN)


### ===========================================================================
make_example 3.3            makefile
2    .c.o:                  后缀规则
touch 01test.c 02test.c
01test.c--->01test     02test.c--->02test
编译多个可执行文件


.PHONY clean all
BIN=01test 02test
all: $(BIN)

.c.o:
	gcc -Wall -g -c $< -o $@

01test: 01test.o
	gcc -Wall -g $^ -o $@
02test: 02test.o
	gcc -Wall -g $^ -o $@

clean: 
	rm -f $(BIN) *.o




### ===========================================================================
make_example 3.4            makefile
1    %.o: %.c                模式规则
touch 01test.c 02test.c             pub.c pub.h
01test.c--->01test     02test.c--->02test
编译多个可执行文件


.PHONY clean all
CC=gcc
CFLAGS=-Wall -g
BIN=01test 02test
all: $(BIN)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

01test: 01test.o
	$(CC) $(CFLAGS) $^ -o $@
02test: 02test.o pub.o
	$(CC) $(CFLAGS) $^ -o $@

clean: 
	rm -f $(BIN) *.o








