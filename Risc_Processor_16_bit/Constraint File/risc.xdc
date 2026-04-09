# clk input is from the 100 MHz oscillator on Boolean board
create_clock -period 10.000 -name gclk [get_ports clk]
set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports {clk}]

# Set Bank 0 voltage
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

# On-board Slide Switches
set_property -dict {PACKAGE_PIN V2 IOSTANDARD LVCMOS33} [get_ports {SW[0]}]
set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports {SW[1]}]
set_property -dict {PACKAGE_PIN U1 IOSTANDARD LVCMOS33} [get_ports {SW[2]}]

# On-board LEDs
set_property -dict {PACKAGE_PIN G1 IOSTANDARD LVCMOS33} [get_ports {LED[0]}]
set_property -dict {PACKAGE_PIN G2 IOSTANDARD LVCMOS33} [get_ports {LED[1]}]
set_property -dict {PACKAGE_PIN F1 IOSTANDARD LVCMOS33} [get_ports {LED[2]}]
set_property -dict {PACKAGE_PIN F2 IOSTANDARD LVCMOS33} [get_ports {LED[3]}]
set_property -dict {PACKAGE_PIN E1 IOSTANDARD LVCMOS33} [get_ports {LED[4]}]
set_property -dict {PACKAGE_PIN E2 IOSTANDARD LVCMOS33} [get_ports {LED[5]}]
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports {LED[6]}]
set_property -dict {PACKAGE_PIN E5 IOSTANDARD LVCMOS33} [get_ports {LED[7]}]
#set_property -dict {PACKAGE_PIN E6 IOSTANDARD LVCMOS33} [get_ports {LED[8]}]
#set_property -dict {PACKAGE_PIN C3 IOSTANDARD LVCMOS33} [get_ports {LED[9]}]
#set_property -dict {PACKAGE_PIN B2 IOSTANDARD LVCMOS33} [get_ports {LED[10]}]
#set_property -dict {PACKAGE_PIN A2 IOSTANDARD LVCMOS33} [get_ports {LED[11]}]
#set_property -dict {PACKAGE_PIN B3 IOSTANDARD LVCMOS33} [get_ports {LED[12]}]
set_property -dict {PACKAGE_PIN A3 IOSTANDARD LVCMOS33} [get_ports flag_L]
set_property -dict {PACKAGE_PIN B4 IOSTANDARD LVCMOS33} [get_ports flag_G]
set_property -dict {PACKAGE_PIN A4 IOSTANDARD LVCMOS33} [get_ports flag_Z]

# On-board Buttons
set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS33} [get_ports rst]
