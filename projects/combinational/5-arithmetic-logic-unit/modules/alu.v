`timescale 1ns / 1ps

/* Arithmetic logic unit 
 * ---------------------
 * 6-bit arithmetic logic unit with a 3-bit opcode, supporting:
 *
 * - Add (A + B)
 * - Subtract (A - B)
 * - Decrement (A - 1)
 * - Increment (A + 1)
 * - Bitwise NOT
 * - Bitwise AND
 * - Bitwise OR
 * - Bitwise XOR
 *
 * Supports input and output values from [-32, 31].
 */

module ALU(
    // 6-bit two's complement value for the first input
    input wire [5:0] a,
    
    // 6-bit two's complement value for the second input
    input wire [5:0] b,
    
    // 3-bit opcode for selecting an ALU operation
    input wire [2:0] op,
    
    // Calculation result
    output reg [5:0] res,
    
    // Error flag for numeric underflow/overflow
    output reg err
);
    parameter MSB = 5;
    always @(*) begin
        err = 1'b0;
        case (op)
            3'b000: begin  
                // Add
                res = a + b;
                /* Underflow/overflow if:
                 * - both inputs negative and result is positive
                 * - both inputs positive and result is negative */
                err = (a[MSB] & b[MSB] & ~(res[MSB])) | (~(a[MSB]) & ~(b[MSB]) & res[MSB]); 
            end
            3'b001: begin  
                // Subtract - get two's complement + add
                res = a + (~b + 6'b1);
                /* Underflow/overflow if:
                 * - both inputs negative and result is positive
                 * - both inputs positive and result is negative
                 * TODO @eonu: this is incorrect, fix this */
                err = (a[MSB] & ~b[MSB] & ~res[MSB]) | (~a[MSB] & ~b[MSB] & res[MSB]); 
            end
            3'b010: begin
                // Decrement by 1
                res = a - 6'b1;
                // Detect underflow
                err = a[MSB] & ~res[MSB];
            end
            3'b011: begin
                // Increment by 1
                res = a + 6'b1;
                // Detect overflow
                err = ~a[MSB] & res[MSB];
            end
            3'b100: res = ~a;  // Bitwise NOT
            3'b101: res = a & b;  // Bitwise AND
            3'b110: res = a | b;  // Bitwise OR
            3'b111: res = a ^ b;  // Bitwise XOR
        endcase
    end
endmodule