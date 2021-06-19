#Constraints of system clock
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { sys_clk }]; 
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {sys_clk}];

#Constraints of system reset
set_property -dict { PACKAGE_PIN J15  IOSTANDARD LVCMOS33 } [get_ports { sys_rst_n }];

#Constraints of 3-color LED
set_property -dict { PACKAGE_PIN R12   IOSTANDARD LVCMOS33 } [get_ports { led_rgb[0] }]; #IO_L5P_T0_D06_14 Sch=led16_b
set_property -dict { PACKAGE_PIN M16   IOSTANDARD LVCMOS33 } [get_ports { led_rgb[1] }]; #IO_L10P_T1_D14_14 Sch=led16_g
set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { led_rgb[2] }]; #IO_L11P_T1_SRCC_14 Sch=led16_r