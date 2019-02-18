# general Makefile
# ================

include Makefile.common

LDFLAGS=$(COMMONFLAGS) -fno-exceptions -ffunction-sections \
			-fdata-sections -L$(LIBDIR) \
			-nostartfiles -Wl,--gc-sections,-Tldscripts/linker.ld



LDLIBS+=-lstm32

STARTUP=startup.S

all: libraries user
	$(CC) -o output/$(PROGRAM).elf $(LDFLAGS) \
		-Wl,--whole-archive \
			user/app.a \
		-Wl,--no-whole-archive \
			$(LDLIBS)
	$(OBJCOPY) -O ihex output/$(PROGRAM).elf output/$(PROGRAM).hex
	$(OBJCOPY) -O binary output/$(PROGRAM).elf output/$(PROGRAM).bin



# Extract info contained in ELF to readable text-files:
# =====================================================
	arm-none-eabi-readelf -a output/$(PROGRAM).elf > output/$(PROGRAM).info_elf
	arm-none-eabi-size -d -B -t output/$(PROGRAM).elf > output/$(PROGRAM).info_size
	arm-none-eabi-objdump -S output/$(PROGRAM).elf > output/$(PROGRAM).info_code
	arm-none-eabi-nm -t x -S --numeric-sort -s output/$(PROGRAM).elf > output/$(PROGRAM).info_symbol


.PHONY: libraries user clean display

libraries:
	$(MAKE) -C libraries $@
user:
	$(MAKE) -C user $@
clean:
	$(MAKE) -C user $@
	$(MAKE) -C libraries $@
	rm -f output/$(PROGRAM).elf output/$(PROGRAM).hex \
		output/$(PROGRAM).bin output/$(PROGRAM).info_elf \
			output/$(PROGRAM).info_size output/$(PROGRAM).info_code \
				output/$(PROGRAM).info_symbol
	
display:
	@echo "######################################################################################################"
	@echo "######## optimize settings: $(InfoTextLib), $(InfoTextSrc)"
	@echo "######################################################################################################"
