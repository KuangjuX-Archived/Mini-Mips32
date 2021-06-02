#Constraints of system clock
set_property -dict { PACKAGE_PIN F5  IOSTANDARD LVCMOS33 } [get_ports { sys_clk }];

#Constraints of system reset
set_property -dict { PACKAGE_PIN K5  IOSTANDARD LVCMOS33 } [get_ports { sys_rst_n }];

#Constraints of red and green led
set_property -dict { PACKAGE_PIN L14  IOSTANDARD LVCMOS33 } [get_ports { led_r }];
set_property -dict { PACKAGE_PIN M14  IOSTANDARD LVCMOS33 } [get_ports { led_g }];

set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]