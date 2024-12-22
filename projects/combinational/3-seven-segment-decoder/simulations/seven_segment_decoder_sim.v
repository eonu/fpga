`timescale 1ns / 1ps

module TestSevenSegmentDecoder();
    reg [3:0] value;
    reg decimal;
    wire [7:0] segments;
    
    SevenSegmentDecoder CUT (value, decimal, segments);
    
    integer i; 
    integer j;
    
    initial begin
        // Test decimal mode - iterate through all values
        for (i = 0; i < 2; i = i + 1) begin
            decimal = i;
            for (j = 0; j < 16; j = j + 1) begin
                value = i;
                #10;
            end
        end
        $stop;                  
    end
endmodule
