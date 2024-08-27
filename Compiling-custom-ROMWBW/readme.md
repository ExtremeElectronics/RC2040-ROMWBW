To compile a new set of rom and CF images clone the ROMWBW repository from here https://github.com/wwarthen/RomWBW and copy the asm file above to the /Source/HBIOS directory
run the ROMWBW build using the guide in readme in the root of the ROMWBW repository.

After selecting RCZ80 it should give an option to use RCZ80_std_pico or RCZ80_std_picoFP (for front panel support)

Run the rest of the compile and copy the files RCZ80_std_pico.rom and RCZ80_std_pico.rom hd1k_combo.img from the BINARY directory  to the RC2040's SD card

Check the RC2040.ini and ensure the settings point to the new rom and img's

I havent tried the other image options, but I dont see why they shouldn't work.

