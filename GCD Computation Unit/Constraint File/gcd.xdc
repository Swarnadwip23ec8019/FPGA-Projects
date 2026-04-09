# clk input is from the 100 MHz oscillator on Boolean board
create_clock -period 10.000 -name gclk [get_ports clk]
set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports clk]

# Set Bank 0 voltage
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

# On-board Slide A_initches
set_property -dict {PACKAGE_PIN V2 IOSTANDARD LVCMOS33} [get_ports {A_in[0]}]
set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports {A_in[1]}]
set_property -dict {PACKAGE_PIN U1 IOSTANDARD LVCMOS33} [get_ports {A_in[2]}]
set_property -dict {PACKAGE_PIN T2 IOSTANDARD LVCMOS33} [get_ports {A_in[3]}]
set_property -dict {PACKAGE_PIN T1 IOSTANDARD LVCMOS33} [get_ports {A_in[4]}]
set_property -dict {PACKAGE_PIN R2 IOSTANDARD LVCMOS33} [get_ports {A_in[5]}]
set_property -dict {PACKAGE_PIN R1 IOSTANDARD LVCMOS33} [get_ports {A_in[6]}]
set_property -dict {PACKAGE_PIN P2 IOSTANDARD LVCMOS33} [get_ports {A_in[7]}]
set_property -dict {PACKAGE_PIN P1 IOSTANDARD LVCMOS33} [get_ports {B_in[0]}]
set_property -dict {PACKAGE_PIN N2 IOSTANDARD LVCMOS33} [get_ports {B_in[1]}]
set_property -dict {PACKAGE_PIN N1 IOSTANDARD LVCMOS33} [get_ports {B_in[2]}]
set_property -dict {PACKAGE_PIN M2 IOSTANDARD LVCMOS33} [get_ports {B_in[3]}]
set_property -dict {PACKAGE_PIN M1 IOSTANDARD LVCMOS33} [get_ports {B_in[4]}]
set_property -dict {PACKAGE_PIN L1 IOSTANDARD LVCMOS33} [get_ports {B_in[5]}]
set_property -dict {PACKAGE_PIN K2 IOSTANDARD LVCMOS33} [get_ports {B_in[6]}]
set_property -dict {PACKAGE_PIN K1 IOSTANDARD LVCMOS33} [get_ports {B_in[7]}]

# On-board gcd_outs
set_property -dict {PACKAGE_PIN G1 IOSTANDARD LVCMOS33} [get_ports {gcd_out[0]}]
set_property -dict {PACKAGE_PIN G2 IOSTANDARD LVCMOS33} [get_ports {gcd_out[1]}]
set_property -dict {PACKAGE_PIN F1 IOSTANDARD LVCMOS33} [get_ports {gcd_out[2]}]
set_property -dict {PACKAGE_PIN F2 IOSTANDARD LVCMOS33} [get_ports {gcd_out[3]}]
set_property -dict {PACKAGE_PIN E1 IOSTANDARD LVCMOS33} [get_ports {gcd_out[4]}]
set_property -dict {PACKAGE_PIN E2 IOSTANDARD LVCMOS33} [get_ports {gcd_out[5]}]
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports {gcd_out[6]}]
set_property -dict {PACKAGE_PIN E5 IOSTANDARD LVCMOS33} [get_ports {gcd_out[7]}]

set_property -dict {PACKAGE_PIN B3 IOSTANDARD LVCMOS33} [get_ports error_led]
set_property -dict {PACKAGE_PIN A3 IOSTANDARD LVCMOS33} [get_ports done_led]
set_property -dict {PACKAGE_PIN B4 IOSTANDARD LVCMOS33} [get_ports busy_led]
set_property -dict {PACKAGE_PIN A4 IOSTANDARD LVCMOS33} [get_ports idle_led]

# On-board Buttons
set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS33} [get_ports rst]
set_property -dict {PACKAGE_PIN J5 IOSTANDARD LVCMOS33} [get_ports start]


