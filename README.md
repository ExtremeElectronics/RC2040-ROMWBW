# RC2040-ROMWBW code to allow ROMWBW to run on a PI PiPico Or PIPico2

## ROMWBW
Romwbw is a monitor and collection of Z80 programs and CPM/80 programs. ROMWBW allows a wide range of Z80 machines and peripherals to work with CPM80, Forth, Basic and other programs. 
It is open source and available here https://github.com/wwarthen/RomWBW/tree/master 

It is completly separate from this project (apart from the config file(s) in compiling-ROMWBW) as this project is only aim is to create an environment on a Pi Pico that will allow ROMWBW to run. 

## RC2040-ROMWBW Pico Z80 & IDE emulator
The aim is Wherever possible it will be compatible with and RC2040 PCB http://extkits.co.uk/rc2040 (Works much better with the RomWBW kit)
But as ROMWBW doesn't have the ability to start at different ROM positions the three Address select lines on the RC2040 are currently redundent.

The other issue is that ROMWBW uses bank switching to page in blocks of 16k pages. Normally using 512K or RAM and 512K of ROM. This poses a problem in a micro that has a maximum of 264K of memory. 

The ROM has been moved into flash, this is done at startup and the whole of the rom image is copied from SD before the emulation is started. 
The RAM is more of a challenge. By Turning off ROMWBW's RAM disks we can just fit this into a Pico(1)'s ram. This gives 160K in the first 10 ram banks for the emulation.

The image is created from ROMWBW's source and the config used RCZ80_std_picoXXX.asm is in the Compiling-custom-ROMWBW directory
more information about the process nd versions for RC2040, Pico, Pico2(2) and RomWBW kits (FP) are there.

![Screenshot 2024-11-23 212939](https://github.com/user-attachments/assets/90fe8368-67ae-4220-b8b3-bf5141625553)

## Quick start
Copy the files from the sd-card directory to an SD card (extracting the zip)
flash the pico with the appropriate UF2 in the Binary folder of the repository. 


## Buttons

But/Aux - does nothing at present see Notes.

Restart Z80, restarts without reloading the rom or ram from SD

Dump - dumps 0-64K ram into a Bin file on the SD and to console.

## Links 
UART / USB selection works (although debug is still via USB) a switch on the back of the pico WBW

A13,14,15 (RC2040 only) not needed or used with ROMWBW

## FFS (Fast File Serial) - RP20350(only)
FFS currenty only works on the RP20350, cpm tools needs 64K and in a pico(1) there just isn't enough space.
more details at https://github.com/ExtremeElectronics/RC20XX-file-transfer-programs
Only the first 4 slices on IDE0 are accessible.
Very untested at the moment.

## Serial

The switch on the back of the WBW kit selects the serial port default
This can be overriden in the RC2040.ini on the SD card
### SIO A/B
Serial ports can be changed from ROMWBW boot if using SIO 
SIO A is mapped to the default (either USB or UART)
SIO B is mapped to the other serial port.

## Notes
Inreased bank RAM so, With the latest ROMWBW. CP/M 3 and ZPM3 will now work.

There is a new RC2040.ini file ROM and disk images for ROMWBW in the sd-card directory.

SPO256AL2 emulation (port 0x28) is working. 

WS2812 (neopixels) untested.

Parallel port is working.

Two CF images are supported for IDE0 and IDE1 similar to the RC2014 SD Card interface, the size from the id file is overwritten, so 2 dissimillar sized images can now be used and still report to the BIOS correctly.

More information regarding the CPMIDE.id file can be found here https://github.com/ExtremeElectronics/Pico-SD--IDE-interface--for-Rc2014/tree/main/ID-File-Structure including programs to read/edit the important bits.

![Screenshot 2025-08-08 145805](https://github.com/user-attachments/assets/f77c70b0-3032-4bc9-b63d-40de7def95be)


Pico-WBW PCB has a full RomWBW frontpanel with LEDS and Switches on port 0

WBW kit works with both Pico and Pico2 (see separate uf2's in the root)

## Ports 
Port 0x00 is the 8 bit port, the in/out is shared with the switches/LEDs on the front panel. 
Port 0x28 SPO256AL2 allophone port, send an allophone number to this port, or 0 to stop. Polls non-zero when busy.
Port 0x29 Beep port, send a midi note number (1-127) to this port for a beep. 0 for off
Port 0x2a SPO256 AL2 frequency port, 0-127 midi note sets frequency for SPO256AL-2

## PicoWBW
A kit of parts to give you a full RomWBW with frontpanel switches/LEDs Sound with a built in speaker, SPO256AL2 emulation. Available at https://extkits.co.uk/product/pico-romwbw/

![20241123_194524](https://github.com/user-attachments/assets/9bb83998-a8b4-4b08-9177-76e0209d4d85)





## Credits
Thanks to:-
EtchedPixels https://github.com/EtchedPixels Linux based Z80 emulation which the origional code was taken from.
Wayne Warthen https://github.com/wwarthen  for ROMWBW
Also
Grant Searle, Mitch Lalovic and Spencer Owen(RC2014)



