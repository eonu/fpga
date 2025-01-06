`timescale 1ns / 1ps

/* Four-digit seven-segment display decoder
 * ----------------------------------------
 * Displays four 4-bit values on a seven-segment display. */

module FourDigitSevenSegmentDisplay(
    // 100MHz oscillator
    input wire clk_100MHz,
    
    // 4-bit values for each digit to decode
    input wire [3:0] v3, v2, v1, v0,

    // Anode outputs - AN0, AN1, AN2, AN3
    output reg [3:0] anodes,

    // Cathode outputs - CA, CB, CC, CD, CE, CF, CG, DP
    output reg [7:0] cathodes
);   
    wire [3:0] digits;
    wire [7:0] segments;
    
    // Instantiate the decoder
    FourDigitSevenSegmentDecoder FourDigitDecoder (
    .clk_100MHz(clk_100MHz),
    .v3(v3), 
    .v2(v2), 
    .v1(v1), 
    .v0(v0), 
    .digits(4'b1111),  // Enable all digits 
    .decimal(1'b1),  // Set decimal mode
    .anodes(digits),
    .cathodes(segments)
    );
    
    always @(*) begin
        anodes = digits;
        cathodes = segments;
    end
endmodule
