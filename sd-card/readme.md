hd512_combo.img needs to be uncompressed
See Compiling-custom-ROMWBW directory for more info on compiling rom and img files from ROMWBW

.id file give the structure of the disks
disdefs is used for FFS(currently working on RP2350 only, not well tested)
The .rom file is the ROMWBW ROM image
The .img file is the combined CPM disks 

RC2040.ini specifies the emulation options open the ini for more info

### Front panel support
if you swap out the rom for RCZ80_std_picoFP.rom you will get support for the front panel switches and LEDs
if you have a pico2 swapout the rom for RCZ80_std_pico2FP.rom to get more memory, and ram disks

Don't forget to update the RC2040.in to reflect the new rom filenames. 

As the port is shared in and out the switches need to connect to the port via 1K resistors, so as not to damage the pico's outputs. 
