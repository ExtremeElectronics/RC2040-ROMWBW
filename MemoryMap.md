```
-------------- RAM RC2014 512RAM/512ROM card ---------------------

On power up
0x00-0x04 = 4 pages of 16K ROM =64 K

when bank "mode" selected
64 Banks - 
0x00-0x1f = 32 pages of 16K ROM =512
0x20-0x3f = 32 pages of 16K RAM = 512

4 registers select each 16K of Z80 memory space to map to one of 64 banks above either ram or rom.

-------------- ROMWBW RCZ80 - std_pico -----------------------
Mem manager MM_Z2 

Note: TASM gives banks as 32K pages and 0-255 banks

------------- CAPACITY -----------------
ROMBANKS:  16 -> *32K = 512K Not a problem 
RAMBANKS:  4  -> *32K = 128K Not a problem
ROMD_BNKS: 12 -> fine, whatever fits :) 
RAMD_BNKS: 0  -> ok
APP_BNKS:  0  -> ok
----------- MEMORY LAYOUT --------------
BID_ROM0:  0
BID_ROMN:  15
BID_RAM0:  128
BID_RAMN:  131
------------- BANK LAYOUT --------------
TASM 32K Banks -> PICO 16K Banks

BID_BOOT:  0 ROM 32K -> ROM Bank 0x00 & 0x01
BID_IMG0:  1 ROM 32K -> ROM Bank 0x02 & 0x03
BID_IMG1:  2 ROM 32K -> ROM Bank 0x04 & 0x05
BID_IMG2:  3 ROM 32K -> ROM Bank 0x06 & 0x07
BID_ROMD0: 4 ROM 32K -> ROM Bank 0x08 & 0x09
BID_BIOS:  128 = 1st  RAM 32k -> RAM Bank 0x20 & 0x21
BID_RAMD0: 255 = last RAM 32k -> RAM Bank 0x3e & 0x3f
BID_APP0:  255 = last RAM 32k -> RAM Bank 0x3e & 0x3f
BID_BUF:   128 = 1st  RAM 32k -> RAM Bank 0x20 & 0x21
BID_AUX:   129 = 2nd  RAM 32k -> RAM Bank 0x22 & 0x23
BID_USR:   130 = 3rd  RAM 32k -> RAM Bank 0x24 & 0x25
BID_COM:   131 = 4th  RAM 32k -> RAM Bank 0x26 & 0x27
----------------------------------------

= 8 x 16K banks from 0x20 - 0x27  (128K)
AND.... 2 x 16K banks from 0x3E - 0x3F (32K)
```
