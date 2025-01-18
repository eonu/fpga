`timescale 1ns / 1ps

module TestALUDisplay();
    reg clk_100MHz = 0;
    reg [5:0] a;
    reg [5:0] b;
    reg [2:0] op;  
    wire err;
    wire [3:0] anodes;
    wire [7:0] cathodes;

    // Instantiate the module
    ALUDisplay CUT (
    .clk_100MHz(clk_100MHz),
    .a(a),
    .b(b),
    .op(op),
    .err(err),
    .anodes(anodes),
    .cathodes(cathodes)
    );
    
    // Clock generation
    always
        #5 clk_100MHz = ~clk_100MHz;
    
    initial begin
        // Addition
        op = 3'b000;
        a = 6'b001001; b = 6'b001010; #16_000_000;  // 9 + 10 = 19
        b = 6'b111100; #16_000_000;  // 9 + (-4) = 5
        b = 6'b110101; #16_000_000;  // 9 + (-11) = -2 
        a = 6'b010000; b = 6'b010111; #16_000_000;  // 16 + 23 = 39 (overflow)
        a = 6'b111000; b = 6'b111100; #16_000_000;  // (-8) + (-4) = -12
        // Subtract
        op = 3'b001;
        a = 6'b001001; b = 6'b111100; #16_000_000;  // 9 - (-4) = 13
        a = 6'b111100; b = 6'b001001; #16_000_000;  // (-4) - 9 = -13
        a = 6'b111100; b = 6'b110111; #16_000_000;  // (-4) - (-9) = 5
        a = 6'b110000; b = 6'b010111; #16_000_000;  // (-16) - 23 = -39 (underflow)
        $stop;
    end
endmodule
