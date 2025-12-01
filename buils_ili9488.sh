#/bin/bash

sudo apt update
sudo apt install git cmake omxplayer -y
git clone https://github.com/juj/fbcp-ili9341
cd fbcp-ili9341
mkdir build
cd build
cmake -DILI9488=ON -DGPIO_TFT_DATA_CONTROL=24 -DGPIO_TFT_RESET_PIN=25 -DGPIO_TFT_BACKLIGHT=23 -DSPI_BUS_CLOCK_DIVISOR=8 -DSTATISTICS=0 -DBACKLIGHT_CONTROL=ON -DUSE_DMA_TRANSFERS=ON ..
make -j
sudo ./fbcp-ili9341 &
cd /home/spi
omxplayer video.mp4 --loop