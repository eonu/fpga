`timescale 1ns / 1ps

module TestSevenSegmentDisplay();
    reg [3:0] value;
    reg decimal;
    reg [1:0] digit;
    wire [3:0] anodes;
    wire [7:0] cathodes;
    
    SevenSegmentDisplay CUT (value, decimal, digit, anodes, cathodes);
    
    integer i;
    integer j;
    integer k;
    
    initial begin
        /* Iterate through all input combinations:
         * decimal: 0/1 (decimal/hexadecimal mode selector)
         * digit: 0-3 (anode selector)
         * value: 0-15 (numerical value input)
         */
        for (i = 0; i < 2; i = i + 1) begin
            decimal = i;
            for (j = 0; j < 4; j = j + 1) begin
                digit = j;
                for (k = 0; k < 16; k = k + 1) begin
                    value = k;
                    #5;
                end
            end
        end
        $stop;                  
    end
endmodule
