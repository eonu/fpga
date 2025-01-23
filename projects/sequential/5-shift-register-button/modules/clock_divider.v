module ClockDivider #(parameter DIV = 1, parameter CLOCK_FREQ = 100_000_000) (
    input wire clk,
    output reg reclk
);
    // Clock parameters
    parameter LIMIT = CLOCK_FREQ / DIV;
    parameter WIDTH = $clog2(LIMIT);
    parameter ZERO = {{WIDTH} {1'b0}};
    parameter MAX = LIMIT - 1'b1;

    // Divide clock into new signal driven high for 10ns at 2Hz
    reg [WIDTH-1:0] counter = ZERO;
    always @(posedge clk) begin
        if (counter == MAX) begin
            reclk <= 1'b1;
            counter <= ZERO;
        end
        else begin
            reclk <= 1'b0;
            counter <= counter + 1;
        end
    end
endmodule
