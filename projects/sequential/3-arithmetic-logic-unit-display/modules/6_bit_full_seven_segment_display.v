`timescale 1ns / 1ps

module FullSevenSegmentDisplay6Bit(
    // 100MHz oscillator
    input wire clk_100MHz,
    
    // 6-bit two's complement value to display
    input wire [5:0] value,

    // Anode outputs - AN0, AN1, AN2, AN3
    output reg [3:0] anodes,

    // Cathode outputs - CA, CB, CC, CD, CE, CF, CG, DP
    output reg [7:0] cathodes
);
    parameter MSB = 5;
    
    // Decomposed input (sign + absolute value)
    wire sign = value[MSB];
    wire [MSB:0] abs = sign ? (~value + 1) : value;
    
    reg [3:0] sel;  // Digit selector
    reg [3:0] v3, v2, v1, v0;  // Digit values
    
    // Instantiate the decoder
    wire [3:0] digits;
    wire [7:0] segments;
    FourDigitSevenSegmentDecoder FourDigitDecoder (
    .clk_100MHz(clk_100MHz),
    .v3(v3), 
    .v2(v2), 
    .v1(v1), 
    .v0(v0), 
    .digits(sel),
    .decimal(1'b1),  // Set decimal mode
    .anodes(digits),
    .cathodes(segments)
    );
    
    always @(*) begin
        // Initialize all digits as minus sign
        v3 = 4'd10; v2 = 4'd10; v1 = 4'd10; v0 = 4'd10;
        
        // Drive digit values and selector
        if (abs < 6'd10) begin
            sel = sign ? 4'b0011 : 4'b0001;
            v0 = abs[3:0];  // units
        end
        else begin
            sel = sign ? 4'b0111 : 4'b0011;
            v1 = abs / 6'd10;  // tens
            v0 = abs - v1 * 6'd10;  // units
        end

        // Set seven-segment display outputs
        anodes = digits;
        cathodes = segments;
    end
endmodule
