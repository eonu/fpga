/* 6-bit ALU with four-digit seven-segment display
 * -----------------------------------------------
 * ALU with output rendered on a seven-segment display. */

module ALUDisplay (
    // 100MHz oscillator
    input wire clk_100MHz,
    
    // 6-bit two's complement value for the first input
    input wire [5:0] a,
    
    // 6-bit two's complement value for the second input
    input wire [5:0] b,
    
    // 3-bit opcode for selecting an ALU operation
    input wire [2:0] op,    
    // Error flag for numeric underflow/overflow
    output reg err,
    
    // Anode outputs - AN0, AN1, AN2, AN3
    output reg [3:0] anodes,
    
    // Cathode outputs - CA, CB, CC, CD, CE, CF, CG, DP
    output reg [7:0] cathodes
);
    // Instantiate the ALU
    wire [5:0] alu_res;
    wire alu_err;
    ALU ALU (.a(a), .b(b), .op(op), .res(alu_res), .err(alu_err));
    
    // Instantiate the seven-segment display
    wire [3:0] digits;
    wire [7:0] segments;
    FullSevenSegmentDisplay6Bit Display (
    .clk_100MHz(clk_100MHz),
    .value(alu_res),
    .anodes(digits),
    .cathodes(segments)
    );
    
    // Drive the ALU overflow/underflow indicator and anodes/cathodes
    always @(*) begin
        err = alu_err;
        anodes = digits;
        cathodes = segments;
    end
endmodule