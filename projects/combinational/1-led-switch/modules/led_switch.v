`timescale 1ns / 1ps

/* LED - Switch-powered
 * --------------------
 * Switches an LED on/off depending on the position of a switch. */

module LEDSwitch(
    // Input switch.
    input wire switch,
    
    // Output LED.
    output wire led
);
    // Assign the LED output to the value of the switch.
    assign led = switch;
endmodule
