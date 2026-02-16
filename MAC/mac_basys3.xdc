set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk [get_ports clk]

set_property PACKAGE_PIN U18 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

set_property PACKAGE_PIN T18 [get_ports load]
set_property IOSTANDARD LVCMOS33 [get_ports load]


set_property PACKAGE_PIN V17 [get_ports {A[0]}]
set_property PACKAGE_PIN V16 [get_ports {A[1]}]
set_property PACKAGE_PIN W16 [get_ports {A[2]}]
set_property PACKAGE_PIN W17 [get_ports {A[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {A[*]}]

set_property PACKAGE_PIN W15 [get_ports {B[0]}]
set_property PACKAGE_PIN V15 [get_ports {B[1]}]
set_property PACKAGE_PIN W14 [get_ports {B[2]}]
set_property PACKAGE_PIN W13 [get_ports {B[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[*]}]


set_property PACKAGE_PIN U16 [get_ports {Y[0]}]
set_property PACKAGE_PIN E19 [get_ports {Y[1]}]
set_property PACKAGE_PIN U19 [get_ports {Y[2]}]
set_property PACKAGE_PIN V19 [get_ports {Y[3]}]
set_property PACKAGE_PIN W18 [get_ports {Y[4]}]
set_property PACKAGE_PIN U15 [get_ports {Y[5]}]
set_property PACKAGE_PIN U14 [get_ports {Y[6]}]
set_property PACKAGE_PIN V14 [get_ports {Y[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Y[*]}]


set_property PACKAGE_PIN U12 [get_ports done]
set_property IOSTANDARD LVCMOS33 [get_ports done]
