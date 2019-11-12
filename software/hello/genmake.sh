#!/bin/sh

nios2-app-generate-makefile \
   --bsp-dir=../hal_bsp \
   --elf-name=main.elf \
   --src-files=main.c
