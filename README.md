## RC2040 code to allow ROMWBW to run on a PI PiPico 
Where ever possible it will be compatible with and RC2040 PCB
But as ROMWBW doesnt have the ability to start at different ROM positions the three Address select lines are redundent

The other issue is that ROMWBW uses bank switching to page in blocks of 16k pages. Normally using 512K or RAM and 512K of ROM
This poses a problem in a micro that has a maximum of 320K of memory. 

The ROM has been moved into flash, this is done at startup and the whole of the rom image is copied from SD before the emulation is started. 
The RAM is more of a challenge. By Turning off ROMWBW's RAM disks we can get avay with 256M ram. 128K in the first two ram banks and 128K in the last two banks where the ROMWBW HIOS sits

The image is created from ROMWBW's source and the config used RCZ80_std_pico.asm is in the Compiling-custom-ROMWBW directory
more information about the process is there.

## Notes
FFS is currenty broken, although I aim to give some of this functionality back
There is a new RC2040.ini file ROM and disk images for ROMWBW in the sd-card directory.
Two CF images are supported for IDE0 and IDE1 similar to the RC2014 SD Card interface
