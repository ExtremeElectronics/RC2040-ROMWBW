# RC2040-ROMWBW code to allow ROMWBW to run on a PI PiPico 

## ROMWBW
Romwbw is a monitor and collection of Z80 programs and CPM/80 programs. ROMWBW allows a wide range of Z80 machines and peripherals to work with CPM80, Forth, Basic and other programs. 
It is open source and available here https://github.com/wwarthen/RomWBW/tree/master 

It is completly separate from this project (apart from the config file(s) in compiling-ROMWBW) as this project is only aim is to create an environment on a Pi Pico that will allow ROMWBW to run. 

## RC2040-ROMWBW Pico Z80 & IDE emulator
The aim is Wherever possible it will be compatible with and RC2040 PCB http://extkits.co.uk/rc2040
But as ROMWBW doesn't have the ability to start at different ROM positions the three Address select lines are currently redundent.

The other issue is that ROMWBW uses bank switching to page in blocks of 16k pages. Normally using 512K or RAM and 512K of ROM. This poses a problem in a micro that has a maximum of 264K of memory. 

The ROM has been moved into flash, this is done at startup and the whole of the rom image is copied from SD before the emulation is started. 
The RAM is more of a challenge. By Turning off ROMWBW's RAM disks we can get avay with 256M ram. 128K in the first 8 ram banks and 32K in the last two banks where the ROMWBW HIOS sits.

The image is created from ROMWBW's source and the config used RCZ80_std_pico.asm is in the Compiling-custom-ROMWBW directory
more information about the process is there.

## Quick start
Copy the files from the sd-card directory to an SD card (extracting the zip)
flash the pico with the UF2 in the root of the repository. 


## Buttons

### UART / Serial 
switch between USB serial and UART serial output. 

BUT - FFS (broken)
Restart Z80, restarts without reloading the rom or ram from SD
Dump - dumps 64K ram into a Bin file on the SD and to console.


## Notes
FFS is currenty broken, cpm tools needs 64K and in a pico(1) there just isnt enough space. Ill need a Pico2 to get this working.

There is a new RC2040.ini file ROM and disk images for ROMWBW in the sd-card directory.

SPO256AL2 emulation (port 0x28) is working. 

WS2812 (neopixels) untested.

Parallel port is working.

Two CF images are supported for IDE0 and IDE1 similar to the RC2014 SD Card interface


![romwbw16-8-24](https://github.com/user-attachments/assets/60d47d1b-ad1c-487d-b0ce-a513a7ee87ff)

## The RC2040 
A kit of parts that lets you run this and other Z80 emulated systems is available here https://extkits.co.uk/product/rc2040/

![20220921_124314](https://github.com/user-attachments/assets/7536d248-94a7-4b19-8226-6467483e52bd)

## Credits
Thanks to:-
EtchedPixels https://github.com/EtchedPixels Linux based Z80 emulation which the origional code was taken from.
Wayne Warthen https://github.com/wwarthen  for ROMWBW
Also
Grant Searle, Mitch Lalovic and Spencer Owen(Rc2014)



