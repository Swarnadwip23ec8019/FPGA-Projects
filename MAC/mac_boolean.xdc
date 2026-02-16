## =====================================================
## Clock (100 MHz oscillator)
## =====================================================
create_clock -period 10.000 -name sys_clk [get_ports clk]
set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports clk]

## =====================================================
## Configuration Voltage
## =====================================================
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

## =====================================================
## Reset Button (btn[0])
## =====================================================
set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS33} [get_ports rst]

## =====================================================
## Load Button (btn[1])
## =====================================================
set_property -dict {PACKAGE_PIN J5 IOSTANDARD LVCMOS33} [get_ports load]

## =====================================================
## A[3:0] -> Slide Switches sw[3:0]
## =====================================================
set_property -dict {PACKAGE_PIN V2 IOSTANDARD LVCMOS33} [get_ports {A[0]}]
set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports {A[1]}]
set_property -dict {PACKAGE_PIN U1 IOSTANDARD LVCMOS33} [get_ports {A[2]}]
set_property -dict {PACKAGE_PIN T2 IOSTANDARD LVCMOS33} [get_ports {A[3]}]

## =====================================================
## B[3:0] -> Slide Switches sw[7:4]
## =====================================================
set_property -dict {PACKAGE_PIN T1 IOSTANDARD LVCMOS33} [get_ports {B[0]}]
set_property -dict {PACKAGE_PIN R2 IOSTANDARD LVCMOS33} [get_ports {B[1]}]
set_property -dict {PACKAGE_PIN R1 IOSTANDARD LVCMOS33} [get_ports {B[2]}]
set_property -dict {PACKAGE_PIN P2 IOSTANDARD LVCMOS33} [get_ports {B[3]}]

## =====================================================
## Y[7:0] -> LEDs led[7:0]
## =====================================================
set_property -dict {PACKAGE_PIN G1 IOSTANDARD LVCMOS33} [get_ports {Y[0]}]
set_property -dict {PACKAGE_PIN G2 IOSTANDARD LVCMOS33} [get_ports {Y[1]}]
set_property -dict {PACKAGE_PIN F1 IOSTANDARD LVCMOS33} [get_ports {Y[2]}]
set_property -dict {PACKAGE_PIN F2 IOSTANDARD LVCMOS33} [get_ports {Y[3]}]
set_property -dict {PACKAGE_PIN E1 IOSTANDARD LVCMOS33} [get_ports {Y[4]}]
set_property -dict {PACKAGE_PIN E2 IOSTANDARD LVCMOS33} [get_ports {Y[5]}]
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports {Y[6]}]
set_property -dict {PACKAGE_PIN E5 IOSTANDARD LVCMOS33} [get_ports {Y[7]}]

## =====================================================
## done -> LED[15]
## =====================================================
set_property -dict {PACKAGE_PIN A4 IOSTANDARD LVCMOS33} [get_ports done]
