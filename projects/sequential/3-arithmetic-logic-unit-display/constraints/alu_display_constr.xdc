# ALU input pins
set_property PACKAGE_PIN R2 [get_ports {a[5]}]
set_property PACKAGE_PIN T1 [get_ports {a[4]}]
set_property PACKAGE_PIN U1 [get_ports {a[3]}]
set_property PACKAGE_PIN W2 [get_ports {a[2]}]
set_property PACKAGE_PIN R3 [get_ports {a[1]}]
set_property PACKAGE_PIN T2 [get_ports {a[0]}]
set_property PACKAGE_PIN T3 [get_ports {b[5]}]
set_property PACKAGE_PIN V2 [get_ports {b[4]}]
set_property PACKAGE_PIN W13 [get_ports {b[3]}]
set_property PACKAGE_PIN W14 [get_ports {b[2]}]
set_property PACKAGE_PIN V15 [get_ports {b[1]}]
set_property PACKAGE_PIN W15 [get_ports {b[0]}]
set_property PACKAGE_PIN W16 [get_ports {op[2]}]
set_property PACKAGE_PIN V16 [get_ports {op[1]}]
set_property PACKAGE_PIN V17 [get_ports {op[0]}]
set_property PACKAGE_PIN U16 [get_ports err]
set_property IOSTANDARD LVCMOS33 [get_ports {a[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {op[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {op[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {op[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports err]
set_property DRIVE 12 [get_ports err]
set_property SLEW SLOW [get_ports err]

# Seven-segment display output pins
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

# Clock pin
set_property PACKAGE_PIN W5 [get_ports clk_100MHz]
set_property IOSTANDARD LVCMOS33 [get_ports clk_100MHz]
create_clock -period 10.000 -name clk_100MHz -waveform {0.000 5.000} -add [get_ports clk_100MHz]
