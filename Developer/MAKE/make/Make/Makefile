### ===========================================================================
make常用内嵌函数

1 函数调用
	$(function arguments)

2 $(wildcard PATTERN)
	匹配当前目录下的模式文件
	例如：	src=$(wildcard *.c)

3 $(patsubst PATTERN,REPLACEMENT,TEXT)
	模式替换函数
	例如:	$(patsubst %.c,%.o,$src)
	等价于：$(src:.c=.o)

4 shell函数
	执行shell命令
	例如：	$(shell ls -d */)




### ===========================================================================
多级目录的Makefile
main.c,     Makefile,   ui/,    dal/,   bll/


CC      =gcc
CFLAGS  =-Wall -g
BIN=    =main
SUBDIR  =$(shell ls -d */)
ROOTSRC =$(wildcard *.c)
ROOTOBJ =$(ROOTSRC:%.c=%.o)
SUBSRC  =$(shell find $(SUBDIR) -name '*.c')
SUBOBJ  =$(SUBSRC:%.c=%.o)

$(BIN): $(ROOTOBJ) $(SUBOBJ)
	$(CC) $(CFLAGS) -o $(BIN) $(ROOTOBJ) $(SUBOBJ)
.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean

clean:
	rm -r $(BIN) $(ROOTOBJ) $(SUBOBJ)





### ===========================================================================
Makefile test1/ test2/
可以把每个目录下的文件生成可执行文件
### root->Makefile


SUBDIRS=test1 test2
.PHONY: default all clean $(SUBDIRS)
deafult: all ### 此命令会试图生成default,当发现此个命令不存在时，它会生成->all
             ### 此处的default伪目录是为了生成all

all clean:
	$(MAKE) $(SUBDIRS) TARGET=$@   ### make test1 test2 TARGET=all
$(SUBDIRS):                             ### make -c test1 all
	$(MAKE) -c $@ $(TARGET)        ### make -c test2 all

### make all test1/Makefile  ### 把all传递给test1/Makefile
### make all test1/Makefile  ### 把all传递给test2/Makefile
                                       


### test1->Makefile

CC=gcc
BIN=test1
OBJS=test1.o

.PHONY: all clean print
all: print $(BIN)
print:
	@echo "===== make all in $(PWD) ====="
$(BIN): $(OBJ)
	$(CC) $(OBJS) -o $@
%.o: %.c
	$(CC) -c $<
clean:
	@echo "===== make clean in $(PWD) ====="
	rm -f $(BIN) $(OBJ)



### test2->Makefile

CC=gcc
BIN=test2
OBJS=test2.o

.PHONY: all clean print
all: print $(BIN)
print:
	@echo "===== make all in $(PWD) ====="
$(BIN): $(OBJ)
	$(CC) $(OBJS) -o $@
%.o: %.c
	$(CC) -c $<
clean:
	@echo "===== make clean in $(PWD) ====="
	rm -f $(BIN) $(OBJ)


### ===========================================================================




