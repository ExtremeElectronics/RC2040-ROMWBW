#!/bin/bash

# set to the pick SDK path
export PICO_SDK_PATH=/home/pico-sdk

mkdir Build2040
cd Build2040
cmake -DPICO_PLATFORM=rp2040 ..
make -j7
cd ..

mkdir Build2350
cd Build2350
cmake -DPICO_PLATFORM=rp2350 ..
make -j7
cd ..



