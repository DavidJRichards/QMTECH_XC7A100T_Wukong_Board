# Vivado lock design project

## purpose

Script to create Vivado block design project for use with Vitis. Includes serial, gpio, timer, ddr3 etc

## requirement

The Wukong board definition files need to be loaded before running this script. available here: [Wukong board definition files](https://github.com/DavidJRichards/QMTECH_XC7A100T_Wukong_Board/tree/main/board)

copy the Wukong directory to the Xilinx /boards directory, alongside the other board directories. for example on my system they are here: /opt/Xilinx/Vivado/2020.2/data/boards/board_files/Wukong

## usage

from within Vivado in the tcl console navigate to the location of the WukongTest.tcl script and then source the file to create the WukongTest project

## export

After building the bitstream it needs to be exported to be available to Vitis