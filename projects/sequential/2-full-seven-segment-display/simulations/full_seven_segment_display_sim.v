`timescale 1ns / 1ps

module TestFullSevenSegmentDisplay();
    // Inputs
    reg clk_100MHz = 0;
    reg [7:0] value;
    
    // Outputs
    wire [3:0] anodes;
    wire [7:0] cathodes;

    // Initialize the circuit
    FullSevenSegmentDisplay CUT (
    clk_100MHz,
    value,
    anodes,
    cathodes
    );
    
    // Clock generation - 100MHz oscillator
    always
        #5 clk_100MHz = ~clk_100MHz;
        
    initial begin
        /* Positive integers */
        // One digit
        value = 8'd0; #16_000_000;
        value = 8'd4; #16_000_000;
        value = 8'd9; #16_000_000;
        // Two digits
        value = 8'd10; #16_000_000;
        value = 8'd43; #16_000_000;
        value = 8'd99; #16_000_000;
        // Three digits
        value = 8'd100; #16_000_000;
        value = 8'd114; #16_000_000;
        value = 8'd127; #16_000_000;
        $stop;
        /* Negative integers */
        // One digit 
        value = 8'b11111111; #16_000_000;  // -1
        value = 8'b10000001; #16_000_000;  // -127
        $stop;
    end
endmodule
