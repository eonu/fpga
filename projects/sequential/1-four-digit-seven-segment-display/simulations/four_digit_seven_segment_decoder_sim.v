`timescale 1ns / 1ns;

module TestFourDigitSevenSegmentDecoder();
    // Inputs
    reg [3:0] v3, v2, v1, v0;
    reg [3:0] digits;
    reg decimal = 1;
    reg clk_100MHz = 0;
    
    // Outputs
    wire [3:0] anodes;
    wire [7:0] cathodes; 
    
    // Initialize the circuit-under-test
    FourDigitSevenSegmentDecoder CUT (
    clk_100MHz, 
    v3, 
    v2, 
    v1, 
    v0, 
    digits, 
    decimal, 
    anodes, 
    cathodes
    );
    
    // Clock generation - 100MHz oscillator
    always
        #5 clk_100MHz = ~clk_100MHz;
        
    // Synthesis
    initial begin
        // Set digits to be displayed as '4321'
        v3 = 4'd4; v2 = 4'd3; v1 = 4'd2; v0 = 4'd1;
        
        // Test different numbers of digits - 16ms to cover full cycle of all four digits
        
        // Display only one digit
        digits = 4'b0001;  #16_000_000;
        // Display only two digits
        digits = 4'b0011;  #16_000_000;
        // Display only three digits
        digits = 4'b0111;  #16_000_000;
        // Display four digits
        digits = 4'b1111;  #16_000_000;
        $stop;
    end
endmodule
