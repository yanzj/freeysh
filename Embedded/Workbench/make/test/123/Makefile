CC =gcc
obj=main.o add.o sub.o
program=bin
$(program): $(obj)
	$(CC) $^ -o $@

.PHONY: clean
clean:
	rm $(obj) $(program)
