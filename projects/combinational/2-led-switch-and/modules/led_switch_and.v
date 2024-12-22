`timescale 1ns / 1ps

/* LED - AND-powered (two switches)
 * --------------------------------
 * Switches an LED on/off depending on the value of the 
 * logical conjunction of two switches. */

module LEDSwitchAND(
    // First input switch.
    input switch_a,
    
    // Second input switch.
    input switch_b,
    
    // Output LED.
    output led
);
    // Assign the LED output to the logical conjunction of the two switch values.
    assign led = switch_a & switch_b;
endmodule
