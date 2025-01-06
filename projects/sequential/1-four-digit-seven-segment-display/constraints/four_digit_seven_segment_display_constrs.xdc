set_property IOSTANDARD LVCMOS33 [get_ports {anodes[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathodes[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathodes[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathodes[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathodes[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathodes[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathodes[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathodes[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathodes[0]}]
set_property DRIVE 12 [get_ports {anodes[3]}]
set_property DRIVE 12 [get_ports {anodes[2]}]
set_property DRIVE 12 [get_ports {anodes[1]}]
set_property DRIVE 12 [get_ports {anodes[0]}]
set_property DRIVE 12 [get_ports {cathodes[7]}]
set_property DRIVE 12 [get_ports {cathodes[6]}]
set_property DRIVE 12 [get_ports {cathodes[5]}]
set_property DRIVE 12 [get_ports {cathodes[4]}]
set_property DRIVE 12 [get_ports {cathodes[3]}]
set_property DRIVE 12 [get_ports {cathodes[2]}]
set_property DRIVE 12 [get_ports {cathodes[1]}]
set_property DRIVE 12 [get_ports {cathodes[0]}]
set_property SLEW SLOW [get_ports {anodes[3]}]
set_property SLEW SLOW [get_ports {anodes[2]}]
set_property SLEW SLOW [get_ports {anodes[1]}]
set_property SLEW SLOW [get_ports {anodes[0]}]
set_property SLEW SLOW [get_ports {cathodes[7]}]
set_property SLEW SLOW [get_ports {cathodes[6]}]
set_property SLEW SLOW [get_ports {cathodes[5]}]
set_property SLEW SLOW [get_ports {cathodes[4]}]
set_property SLEW SLOW [get_ports {cathodes[3]}]
set_property SLEW SLOW [get_ports {cathodes[2]}]
set_property SLEW SLOW [get_ports {cathodes[1]}]
set_property SLEW SLOW [get_ports {cathodes[0]}]
set_property PACKAGE_PIN W4 [get_ports {anodes[3]}]
set_property PACKAGE_PIN V4 [get_ports {anodes[2]}]
set_property PACKAGE_PIN U4 [get_ports {anodes[1]}]
set_property PACKAGE_PIN U2 [get_ports {anodes[0]}]
set_property PACKAGE_PIN W7 [get_ports {cathodes[7]}]
set_property PACKAGE_PIN W6 [get_ports {cathodes[6]}]
set_property PACKAGE_PIN U8 [get_ports {cathodes[5]}]
set_property PACKAGE_PIN V8 [get_ports {cathodes[4]}]
set_property PACKAGE_PIN U5 [get_ports {cathodes[3]}]
set_property PACKAGE_PIN V5 [get_ports {cathodes[2]}]
set_property PACKAGE_PIN U7 [get_ports {cathodes[1]}]
set_property PACKAGE_PIN V7 [get_ports {cathodes[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {v0[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {v0[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {v0[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {v0[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {v1[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {v1[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {v1[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {v1[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {v2[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {v2[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {v2[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {v2[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {v3[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {v3[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {v3[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {v3[0]}]
set_property PACKAGE_PIN W17 [get_ports {v0[3]}]
set_property PACKAGE_PIN W16 [get_ports {v0[2]}]
set_property PACKAGE_PIN V16 [get_ports {v0[1]}]
set_property PACKAGE_PIN V17 [get_ports {v0[0]}]
set_property PACKAGE_PIN W13 [get_ports {v1[3]}]
set_property PACKAGE_PIN W14 [get_ports {v1[2]}]
set_property PACKAGE_PIN V15 [get_ports {v1[1]}]
set_property PACKAGE_PIN W15 [get_ports {v1[0]}]
set_property PACKAGE_PIN R3 [get_ports {v2[3]}]
set_property PACKAGE_PIN V2 [get_ports {v2[0]}]
set_property PACKAGE_PIN T2 [get_ports {v2[2]}]
set_property PACKAGE_PIN T3 [get_ports {v2[1]}]
set_property PACKAGE_PIN R2 [get_ports {v3[3]}]
set_property PACKAGE_PIN W2 [get_ports {v3[0]}]
set_property PACKAGE_PIN T1 [get_ports {v3[2]}]
set_property PACKAGE_PIN U1 [get_ports {v3[1]}]

set_property PACKAGE_PIN W5 [get_ports clk_100MHz]
set_property IOSTANDARD LVCMOS33 [get_ports clk_100MHz]
create_clock -period 10.000 -name clk_100MHz -waveform {0.000 5.000} -add [get_ports clk_100MHz]
