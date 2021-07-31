# 50 MHz Clock definition
set_property -dict { PACKAGE_PIN M21   IOSTANDARD LVCMOS33 } [get_ports { CLOCK_50 }]; 
create_clock -name CLOCK_50 -period 20.000 [get_ports {CLOCK_50}]

# LED
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports LED[0]]
set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports LED[1]]

# Button
set_property -dict {PACKAGE_PIN H7 IOSTANDARD LVCMOS33} [get_ports BUTTON[0]]
set_property -dict {PACKAGE_PIN M6 IOSTANDARD LVCMOS33} [get_ports BUTTON[1]]

# USB-UART
set_property -dict {PACKAGE_PIN F3 IOSTANDARD LVCMOS33} [get_ports UART_RX]
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports UART_TX]

# HDMI
set_property -dict { PACKAGE_PIN G2   IOSTANDARD TMDS_33 } [get_ports { HDMI_TX[2]   }];
set_property -dict { PACKAGE_PIN G1   IOSTANDARD TMDS_33 } [get_ports { HDMI_TX_N[2] }];

set_property -dict { PACKAGE_PIN F2   IOSTANDARD TMDS_33 } [get_ports { HDMI_TX[1]   }];
set_property -dict { PACKAGE_PIN E2   IOSTANDARD TMDS_33 } [get_ports { HDMI_TX_N[1] }];

set_property -dict { PACKAGE_PIN E1   IOSTANDARD TMDS_33 } [get_ports { HDMI_TX[0]   }];
set_property -dict { PACKAGE_PIN D1   IOSTANDARD TMDS_33 } [get_ports { HDMI_TX_N[0] }];

set_property -dict { PACKAGE_PIN D4   IOSTANDARD TMDS_33 } [get_ports { HDMI_CLK     }];
set_property -dict { PACKAGE_PIN C4   IOSTANDARD TMDS_33 } [get_ports { HDMI_CLK_N   }];

# Keyboard
set_property -dict { PACKAGE_PIN AC26   IOSTANDARD LVCMOS33 } [get_ports { PS2_CLOCK   }];
set_property -dict { PACKAGE_PIN AB26   IOSTANDARD LVCMOS33 } [get_ports { PS2_DATA    }];

# Ethernet
set_property -dict {PACKAGE_PIN R2 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_txd[0]]
set_property -dict {PACKAGE_PIN P1 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_txd[1]]
set_property -dict {PACKAGE_PIN N2 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_txd[2]]
set_property -dict {PACKAGE_PIN N1 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_txd[3]]
set_property -dict {PACKAGE_PIN M1 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_txd[4]]
set_property -dict {PACKAGE_PIN L2 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_txd[5]]
set_property -dict {PACKAGE_PIN K2 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_txd[6]]
set_property -dict {PACKAGE_PIN K1 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_txd[7]]

set_property -dict {PACKAGE_PIN U1 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_gtx_clk]
set_property -dict {PACKAGE_PIN T2 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_tx_en]
set_property -dict {PACKAGE_PIN M2 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_tx_clk]
set_property -dict {PACKAGE_PIN J1 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_tx_er]

set_property -dict {PACKAGE_PIN H2 IOSTANDARD LVCMOS33} [get_ports mdio_io_mdc]
set_property -dict {PACKAGE_PIN H1 IOSTANDARD LVCMOS33} [get_ports mdio_io_io]

set_property -dict {PACKAGE_PIN M4 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_rxd[0]]
set_property -dict {PACKAGE_PIN N3 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_rxd[1]]
set_property -dict {PACKAGE_PIN N4 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_rxd[2]]
set_property -dict {PACKAGE_PIN P3 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_rxd[3]]
set_property -dict {PACKAGE_PIN R3 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_rxd[4]]
set_property -dict {PACKAGE_PIN T3 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_rxd[5]]
set_property -dict {PACKAGE_PIN T4 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_rxd[6]]
set_property -dict {PACKAGE_PIN T5 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_rxd[7]]

set_property -dict {PACKAGE_PIN P4 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_rx_clk]
set_property -dict {PACKAGE_PIN L3 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_rx_dv]
set_property -dict {PACKAGE_PIN U5 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_rx_er]

#set_property -dict {PACKAGE_PIN U4 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_col]
#set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_crs]
#set_property -dict {PACKAGE_PIN R1 IOSTANDARD LVCMOS33} [get_ports gmii_rtl_rstn]

#pmod J11 (lower from left)
#6 3V3
#5 Gnd
#4 RxD
#3 TxD
#2 RTS
#1 CTS
set_property -dict {LOC J4  IOSTANDARD LVCMOS25} [get_ports uart_rxd]
set_property -dict {LOC G4  IOSTANDARD LVCMOS25 SLEW SLOW DRIVE 12} [get_ports uart_txd]
set_property -dict {LOC B4  IOSTANDARD LVCMOS25 SLEW SLOW DRIVE 12} [get_ports uart_rts]
set_property -dict {LOC B5  IOSTANDARD LVCMOS25} [get_ports uart_cts]

set_false_path -to [get_ports {uart_txd uart_rts}]
set_output_delay 0 [get_ports {uart_txd uart_rts}]
set_false_path -from [get_ports {uart_rxd uart_cts}]
set_input_delay 0 [get_ports {uart_rxd uart_cts}]





set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
