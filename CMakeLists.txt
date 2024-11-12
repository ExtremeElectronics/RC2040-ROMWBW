
#  set(PICO_PLATFORM rp2350)
  set(PICO_PLATFORM rp2040)

string(APPEND CMAKE_EXE_LINKER_FLAGS "-Wl,--print-memory-usage")

#  set(picotool_DIR /usr/local/bin/picotool)
  cmake_minimum_required(VERSION 3.13)

  set(CMAKE_C_STANDARD 11)
  set(CMAKE_CXX_STANDARD 17)

  include(pico_sdk_import.cmake)

  project(RC2040P2 C CXX ASM)
  set(CMAKE_C_STANDARD 11)
  set(CMAKE_CXX_STANDARD 17)

  pico_sdk_init()


  add_executable(RC2040P2
	RC2040P2.c 
        ide.c 
        z80dis.c 
        acia.c
        hw_config.c
        dictionary.c
	iniparser.c

   #cpm tools
        cpmfs.c
        device_sdfs.c

  )

  pico_generate_pio_header(RC2040P2  ${CMAKE_CURRENT_LIST_DIR}/ws2812.pio)



  add_subdirectory(FatFs_SPI build)


  add_subdirectory(libz80)
  link_directories(libz80)


  # Add the standard library and FatFS/SPI to the build
  target_link_libraries(RC2040P2 
    pico_multicore
    hardware_gpio 
    hardware_pwm
    pico_stdlib
    hardware_pio 
    hardware_dma 
    hardware_irq
    hardware_flash
    hardware_spi
    FatFs_SPI
    libz80
    hardware_rtc
  )

  pico_enable_stdio_usb(RC2040P2 1)
  pico_enable_stdio_uart(RC2040P2 1)

  pico_add_extra_outputs(RC2040P2)

  add_compile_definitions(PICO_STDIO_USB_ENABLE_RESET_VIA_BAUD_RATE=1)
  add_compile_definitions(PICO_STDIO_USB_ENABLE_RESET_VIA_VENDOR_INTERFACE=0)

