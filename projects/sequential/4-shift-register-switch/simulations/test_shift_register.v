`timescale 1ns / 1ps

module TestShiftRegister();
    reg clk_100MHz = 0;
    reg serial_in;
    wire [15:0] parallel_out;
    
    ShiftRegister CUT (
    .clk_100MHz(clk_100MHz),
    .serial_in(serial_in),
    .parallel_out(parallel_out)
    );
    
    always
        #5 clk_100MHz = ~clk_100MHz;

    initial begin
        serial_in = 1'b1; #2_500_000_000;
        serial_in = 1'b0; #2_000_000_000;
        serial_in = 1'b1; #4_000_000_000;
        serial_in = 1'b0; #1_500_000_000;
        $stop;
    end
endmodule
