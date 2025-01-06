# LED - Switch-powered

This module should implement a basic switch-powered LED connection that: 

- illuminates an LED on the development board when the switch is turned on, 
- disables the LED when the switch is turned off.

<details>
<summary>
    <b>Click here to view the schematic diagram for this circuit's module implementation</b>
</summary>

<p>
    <br/>
    <img width="600px" src="schematic.png"/>
</p>
</details>

## Inputs

- `switch`: 1-bit input representing the state of the switch.
  - Should be controlled by a single slide switch.

## Outputs

- `led`: 1-bit output representing the state of the LED.
