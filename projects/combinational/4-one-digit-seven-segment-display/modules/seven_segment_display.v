`timescale 1ns / 1ps

/* One-digit seven-segment display
 * -------------------------------
 * Displays a 4-bit value on a seven-segment display.
 * Can display 0-9 in decimal, or 0-15 in hexadecimal.
 */

module SevenSegmentDisplay(
    // 4-bit value to display
    input wire [3:0] value,

    /* Whether or not to decode to decimal.
     * - If 0, values 0-15 are decoded into hexadecimal 0-F
     * - If 0, values 0-9 are decoded into decimal 0-9 and values 10-15 into - */
    input wire decimal,

    // Digit selector - Basys3 has a four digit seven-segment display.
    input wire [1:0] digit,

    // Inverted one-hot encoded digit selector
    output reg [3:0] anodes,

    // Inverted one-hot encoded segment selector
    output reg [7:0] cathodes
);
    wire [7:0] segments;
    SevenSegmentDecoder Decoder (.value(value), .decimal(decimal), .segments(segments));
    
    always @(*) begin
        // Drive anodes - convert to inverted one-hot encoding
        case (digit)
            2'b00: anodes = ~4'b0001;
            2'b01: anodes = ~4'b0010;
            2'b10: anodes = ~4'b0100;
            2'b11: anodes = ~4'b1000;
        endcase
        
        // Drive cathodes
        cathodes = segments;
    end
endmodule
