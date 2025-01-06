# Seven-segment display decoder

A seven-segment display is a form of output that can be used to display simple glyphs that can be constructed from seven linear segments. They are commonly used to show numerical values in the form of decimal or hexadecimal digits.

<p align="center">
    <img width="500px" src="seven-segment-display.png"/>
</p>

A seven-segment display decoder should accept a numerical value as input, and decode the value into seven output signals indicating which segments must be simultaneously illuminated in order to render that value on the display.

This behaviour can be captured in a simple combinational logic circuit and implemented as a HDL module.

**Note**: This module should only implement the decoding, not the routing to I/O pins on the FPGA — only module design and simulation are necessary (no synthesis, implementation or bitstream generation).

<details>
<summary>
    <b>Click here to view the schematic diagram for this circuit's module implementation</b>
</summary>
<p>
    <br/>
    <img width="750px" src="schematic.png"/>
</p>
</details>

## Inputs

- `value`: 4-bit input representing the value to be displayed (0-15).
  - Should be controlled by four slide switches.
- `decimal`: 1-bit input representing a decimal/hexadecimal mode selector.
  - Should be controlled by a single slide switch.
  - When driven high, the display should be in decimal mode and show:
    - digits 0-9 if `value` is between 0-9, 
    - a hyphen (`-`) if `value` is between 10-15.
  - When driven low, the display should be in hexadecimal mode and show:
    - digits 0-9 if `value` is between 0-9,
    - letters A-F if `value` is between 10-15.

## Outputs

- `segments`: 8-bit output representing the segments to be illuminated.

## Comments

The Digilent Basys-3 has a four-digit seven-segment display which has:

- a single 4-bit common anode input to select a digit,
- eight 1-bit cathode inputs to illuminate each of the seven segments of the selected anode.

Both the anode and cathode values need to be driven low in order to select a digit and illuminate a segment.
