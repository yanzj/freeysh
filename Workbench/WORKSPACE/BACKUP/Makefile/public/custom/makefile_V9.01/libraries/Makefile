# libs Makefile
# ==============

include ../Makefile.common
LIBS+=libstm32.a
CFLAGSlib+=-c


all: libraries

libraries: $(LIBS)

libstm32.a:
	@echo -n "Building $@ ..."
	@cd $(KERNEL)/device/src && \
		$(CC) $(CFLAGSlib) \
			system_stm32f10x.c
	@cd $(STMLIB)/F1_LIB/src && \
		$(CC) $(CFLAGSlib) \
			-D"assert_param(expr)=((void)0)" \
			*.c
	@cd $(STMLIB)/BSP_LIB/src && \
		$(CC) $(CFLAGSlib) \
			-D"assert_param(expr)=((void)0)" \
			*.c

	@$(AR) cr $(LIBDIR)/$@ \
		$(KERNEL)/device/src/system_stm32f10x.o \
		$(STMLIB)/F1_LIB/src/*.o \
		$(STMLIB)/BSP_LIB/src/*.o
	@echo "done."


.PHONY: libraries clean display
clean:
	rm -f $(KERNEL)/device/src/system_stm32f10x.o
	rm -f $(STMLIB)/F1_LIB/src/*.o
	rm -f $(STMLIB)/BSP_LIB/src/*.o
	rm -f $(LIBS)
display:
	@echo "######################################################################################################"
	@echo "######## optimize settings: $(InfoTextLib), $(InfoTextSrc)"
	@echo "######################################################################################################"
