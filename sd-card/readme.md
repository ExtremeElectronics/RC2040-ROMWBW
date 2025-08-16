For RomWBW to run you need an SD card with a few files.

## RC2040.ini
The rc2040.ini file is the key to telling the system what rom, disks and formats you are using. 
It is structured as a classic ini file. 
Any line starting with a hash is not read.
RC2040.ini specifies the emulation options open the ini for more info

An example to get you started is downloadable above. 

Along with your rc2040ini files you will need in the root of the SD card 

a CPMIDE.id file

at least one .img file

one .rom file

a diskdefs file

## CPMIDE.id 
You will also need a CPMIDE.id file
This gives you the format of your disk drives. 
Currently there are two formats 512 and 1k

## .img file
These are the content of your disks. you can have up to two disks loaded, but they MUST be the same format (1k or 512) and the MUST match the COMIDE.id file and diskdefs file.
See Compiling-custom-ROMWBW directory for more info on compiling img files for ROMWBW

## .rom file
This is the ROM for your system. This will automatically be loaded if the checksum of the rom in the Pico does not match the rom on the SD card. 
If you need to force this to happen, delete the autocreated file RomCkSum from the SD card.
There are thre rom files one for a Pico on a RC2040 kit - RCZ80_std_pico.rom
one for a Pico on a RomWBW kit - RCZ80_std_picoFP.rom and
one for a Pico2 on a RomWBW kit - RCZ80_std_pico2FP.rom

See Compiling-custom-ROMWBW directory for more info on compiling rom files for ROMWBW

### Note 
Don't forget to update the RC2040.ini to reflect the new rom or img filenames. 


