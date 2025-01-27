# Seven-segment display
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

# Up button
set_property IOSTANDARD LVCMOS33 [get_ports {up}]
set_property DRIVE 12 [get_ports {up}]
set_property SLEW SLOW [get_ports {up}]
set_property PACKAGE_PIN T18 [get_ports {up}]

# Down button
set_property IOSTANDARD LVCMOS33 [get_ports {down}]
set_property DRIVE 12 [get_ports {down}]
set_property SLEW SLOW [get_ports {down}]
set_property PACKAGE_PIN U17 [get_ports {down}]

# Reset button
set_property IOSTANDARD LVCMOS33 [get_ports {reset}]
set_property DRIVE 12 [get_ports {reset}]
set_property SLEW SLOW [get_ports {reset}]
set_property PACKAGE_PIN U18 [get_ports {reset}]

# Divisible LED indicator
set_property IOSTANDARD LVCMOS33 [get_ports {div}]
set_property DRIVE 12 [get_ports {div}]
set_property SLEW SLOW [get_ports {div}]
set_property PACKAGE_PIN L1 [get_ports {div}]

# Clock
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name clk -waveform {0.000 5.000} -add [get_ports clk]