#################################################################
## ==============================================================
# Define required macros here
SHELL = /bin/sh

CC       =gcc
CFLAGS   =-Wall -g
LDFLAGS  =
INCLUDES =
OBJS     =main.o select_sort.o
LDLIBS   =
PROGRAM  =target


${PROGRAM}: ${OBJS}
	${CC} ${CFLAGS} ${INCLUDES} -o $@ ${OBJS}   \
                                          ${LDFLAGS}\
                                          ${LDLIBS}
	@echo "========== Compiler completed!!! =========="
.c.o:
	${CC} ${CFLAGS} ${INCLUDES} -c $<

.PHONY: clean 

clean:
	rm -f *.o ${PROGRAM}









