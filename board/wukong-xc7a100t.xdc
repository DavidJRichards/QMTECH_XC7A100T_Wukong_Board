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




set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
