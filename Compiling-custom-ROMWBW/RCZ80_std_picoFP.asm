;
;==================================================================================================
;   RCBUS Z80 STANDARD CONFIGURATION
;==================================================================================================
;
; THE COMPLETE SET OF DEFAULT CONFIGURATION SETTINGS FOR THIS PLATFORM ARE FOUND IN THE
; CFG_<PLT>.ASM INCLUDED FILE WHICH IS FOUND IN THE PARENT DIRECTORY.  THIS FILE CONTAINS
; COMMON CONFIGURATION SETTINGS THAT OVERRIDE THE DEFAULTS.  IT IS INTENDED THAT YOU MAKE
; YOUR CUSTOMIZATIONS IN THIS FILE AND JUST INHERIT ALL OTHER SETTINGS FROM THE DEFAULTS.
; EVEN BETTER, YOU CAN MAKE A COPY OF THIS FILE WITH A NAME LIKE <PLT>_XXX.ASM AND SPECIFY
; YOUR FILE IN THE BUILD PROCESS.
;
; THE SETTINGS BELOW ARE THE SETTINGS THAT ARE MOST COMMONLY MODIFIED FOR THIS PLATFORM.
; MANY OF THEM ARE EQUAL TO THE SETTINGS IN THE INCLUDED FILE, SO THEY DON'T REALLY DO
; ANYTHING AS IS.  THEY ARE LISTED HERE TO MAKE IT EASY FOR YOU TO ADJUST THE MOST COMMON
; SETTINGS.
;
; N.B., SINCE THE SETTINGS BELOW ARE REDEFINING VALUES ALREADY SET IN THE INCLUDED FILE,
; TASM INSISTS THAT YOU USE THE .SET OPERATOR AND NOT THE .EQU OPERATOR BELOW. ATTEMPTING
; TO REDEFINE A VALUE WITH .EQU BELOW WILL CAUSE TASM ERRORS!
;
; PLEASE REFER TO THE CUSTOM BUILD INSTRUCTIONS (README.TXT) IN THE SOURCE DIRECTORY (TWO
; DIRECTORIES ABOVE THIS ONE).
;
#DEFINE	BOOT_DEFAULT	"H"		; DEFAULT BOOT LOADER CMD ON <CR> OR AUTO BOOT
;
#DEFINE SYSINFO 1;
;
#include "cfg_rcz80.asm"
;
CPUOSC		.SET	7372800		; CPU OSC FREQ IN MHZ
CRTACT		.SET	FALSE		; ACTIVATE CRT (VDU,CVDU,PROPIO,ETC) AT STARTUP
;
CTCENABLE	.SET	FALSE		; ENABLE ZILOG CTC SUPPORT

CHENABLE	.SET	FALSE		; CH: ENABLE CH375/376 USB SUPPORT

RAMSIZE		.SET	160		; SIZE OF RAM IN KB (MUST MATCH YOUR HARDWARE!!!)
ROMSIZE		.SET	512		; SIZE OF ROM IN KB (MUST MATCH YOUR HARDWARE!!!)
;
FPLED_ENABLE	.SET	TRUE		; FP: ENABLES FRONT PANEL LEDS
FPLED_IO	.SET	$00		; FP: PORT ADDRESS FOR FP LEDS
FPLED_INV	.SET	FALSE		; FP: LED BITS ARE INVERTED
FPLED_DSKACT	.SET	TRUE		; FP: ENABLES DISK I/O ACTIVITY ON FP LEDS
FPSW_ENABLE	.SET	TRUE		; FP: ENABLES FRONT PANEL SWITCHES
FPSW_IO		.SET	$00		; FP: PORT ADDRESS FOR FP SWITCHES
FPSW_INV	.SET	FALSE		; FP: SWITCH BITS ARE INVERTED
;
DSRTCENABLE	.SET	FALSE		; DSRTC: ENABLE DS-1302 CLOCK DRIVER (DSRTC.ASM)
RP5RTCENABLE	.SET	FALSE		; RP5C01 RTC BASED CLOCK (RP5RTC.ASM)
;
UARTENABLE	.SET	TRUE		; UART: ENABLE 8250/16550-LIKE SERIAL DRIVER (UART.ASM)
ACIAENABLE	.SET	TRUE		; ACIA: ENABLE MOTOROLA 6850 ACIA DRIVER (ACIA.ASM)
SIOENABLE	.SET	TRUE		; SIO: ENABLE ZILOG SIO SERIAL DRIVER (SIO.ASM)
DUARTENABLE	.SET	FALSE		; DUART: ENABLE 2681/2692 SERIAL DRIVER (DUART.ASM)
;
LPTENABLE	.SET	FALSE		; LPT: ENABLE CENTRONICS PRINTER DRIVER (LPT.ASM)
;
TMSENABLE	.SET	FALSE		; TMS: ENABLE TMS9918 VIDEO/KBD DRIVER (TMS.ASM)
TMSTIMENABLE	.SET	FALSE		; TMS: ENABLE TIMER INTERRUPTS (REQUIRES IM1)
TMSMODE		.SET	TMSMODE_MSX	; TMS: DRIVER MODE: TMSMODE_[SCG|N8|MBC|MSX|MSX9958|MSXKBD|COLECO]
MKYENABLE	.SET	FALSE		; MSX 5255 PPI KEYBOARD COMPATIBLE DRIVER (REQUIRES TMS VDA DRIVER)
VRCENABLE	.SET	FALSE		; VRC: ENABLE VGARC VIDEO/KBD DRIVER (VRC.ASM)
VDAEMU_SERKBD	.SET	0		; VDA EMULATION: SERIAL KBD UNIT #, OR $FF FOR HW KBD
;

AY38910ENABLE	.SET	FALSE		; AY: AY-3-8910 / YM2149 SOUND DRIVER
AYMODE		.SET	AYMODE_RCZ80	; AY: DRIVER MODE: AYMODE_[SCG|N8|RCZ80|RCZ180|MSX|LINC]
SN76489ENABLE	.SET	FALSE		; SN: ENABLE SN76489 SOUND DRIVER
;
FDENABLE	.SET	FALSE		; FD: ENABLE FLOPPY DISK DRIVER (FD.ASM)
FDMODE		.SET	FDMODE_RCWDC	; FD: DRIVER MODE: FDMODE_[DIO|ZETA|ZETA2|DIDE|N8|DIO3|RCSMC|RCWDC|DYNO|EPFDC]
;
IDEENABLE	.SET	TRUE		; IDE: ENABLE IDE DISK DRIVER (IDE.ASM)
PPIDEENABLE	.SET	FALSE		; PPIDE: ENABLE PARALLEL PORT IDE DISK DRIVER (PPIDE.ASM)
SDENABLE	.SET	FALSE		; SD: ENABLE SD CARD DISK DRIVER (SD.ASM)
SDMODE		.SET	SDMODE_PIO	; SD: DRIVER MODE: SDMODE_[JUHA|N8|CSIO|PPI|UART|DSD|MK4|SC|MT|PIO|USR]
SDCNT		.SET	1		; SD: NUMBER OF SD CARD DEVICES (1-2), FOR DSD/SC/MT SC ONLY
IMMENABLE	.SET	FALSE		; IMM: ENABLE IMM DISK DRIVER (IMM.ASM)
;
PRPENABLE	.SET	FALSE		; PRP: ENABLE ECB PROPELLER IO BOARD DRIVER (PRP.ASM)
;
MDRAM		.SET	FALSE		; MD: ENABLE RAM DISK
