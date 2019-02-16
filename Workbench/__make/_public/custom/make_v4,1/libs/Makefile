# libs Makefile
# ==============

include ../Makefile.common
LIBS+=libstm32.a
CFLAGSlib+=-c


all: libs

libs: $(LIBS)

libstm32.a:
	@echo -n "Building $@ ..."
	@cd $(KERNEL)/Device/Source && \
		$(CC) $(CFLAGSlib) \
			system_stm32f10x.c
	@cd $(STMLIB)/F1_LIB/src && \
		$(CC) $(CFLAGSlib) \
			-D"assert_param(expr)=((void)0)" \
			-I$(KERNEL)/CMSIS/Include \
			-I$(KERNEL)/Device/Include \
			-I../inc \
			*.c
	@cd $(STMLIB)/BSP_LIB/src && \
		$(CC) $(CFLAGSlib) \
			-D"assert_param(expr)=((void)0)" \
			-I$(KERNEL)/CMSIS/Include \
			-I$(KERNEL)/Device/Include \
			-I../inc \
			*.c

	@$(AR) cr $(LIBDIR)/$@ \
		$(KERNEL)/Device/Source/system_stm32f10x.o \
		$(STMLIB)/F1_LIB/src/*.o \
		$(STMLIB)/BSP_LIB/src/*.o
	@echo "done."


.PHONY: libs clean tshow
clean:
	rm -f $(KERNEL)/Device/Source/system_stm32f10x.o
	rm -f $(STMLIB)/F1_LIB/src/*.o
	rm -f $(STMLIB)/BSP_LIB/src/*.o
	rm -f $(LIBS)
tshow:
	@echo "######################################################################################################"
	@echo "######## optimize settings: $(InfoTextLib), $(InfoTextSrc)"
	@echo "######################################################################################################"
