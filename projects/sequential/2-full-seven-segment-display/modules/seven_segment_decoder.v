`timescale 1ns / 1ps

/* Seven-segment display decoder
 * -----------------------------
 * Converts a 4-bit value into seven-segment cathode outputs.
 * Can decode to a decimal or hexadecimal digit. 
 * Note: Cathode values are expected to be inverted. */

module SevenSegmentDecoder(
    // 4-bit value to decode.
    input wire [3:0] value,
    
    /* Whether or not to decode to decimal.
     * - If 0, values 0-15 are decoded into hexadecimal 0-F
     * - If 0, values 0-9 are decoded into decimal 0-9 and values 10-15 into - */
    input wire decimal,
    
    // Cathode outputs - CA, CB, CC, CD, CE, CF, CG, DP
    output reg [7:0] segments
);    
    always @(*)
        if (decimal == 1)
            case (value)           // C(ABCD_EFGP)
                   4'd0: segments = ~8'b1111_1100;
                   4'd1: segments = ~8'b0110_0000;
                   4'd2: segments = ~8'b1101_1010;
                   4'd3: segments = ~8'b1111_0010;
                   4'd4: segments = ~8'b0110_0110;
                   4'd5: segments = ~8'b1011_0110;
                   4'd6: segments = ~8'b1011_1110;
                   4'd7: segments = ~8'b1110_0000;
                   4'd8: segments = ~8'b1111_1110;
                   4'd9: segments = ~8'b1111_0110;
                default: segments = ~8'b0000_0010;
            endcase
        else
            case (value)        // C(ABCD_EFGP)
                4'h0: segments = ~8'b1111_1100;
                4'h1: segments = ~8'b0110_0000;
                4'h2: segments = ~8'b1101_1010;
                4'h3: segments = ~8'b1111_0010;
                4'h4: segments = ~8'b0110_0110;
                4'h5: segments = ~8'b1011_0110;
                4'h6: segments = ~8'b1011_1110;
                4'h7: segments = ~8'b1110_0000;
                4'h8: segments = ~8'b1111_1110;
                4'h9: segments = ~8'b1111_0110;
                4'ha: segments = ~8'b1110_1110;
                4'hb: segments = ~8'b0011_1110;
                4'hc: segments = ~8'b0001_1010;
                4'hd: segments = ~8'b0111_1010;
                4'he: segments = ~8'b1001_1110;
                4'hf: segments = ~8'b1000_1110;
            endcase
endmodule
