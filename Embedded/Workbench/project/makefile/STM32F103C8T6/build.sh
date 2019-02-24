#!/bin/bash

### Cortex-M3 编译烧写脚本
### author: @freeysh, 2019-01-18, 17:35


make
cd output
st-flash write main.bin 0x8000000
