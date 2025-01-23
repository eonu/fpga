// Debouncer for a push-button - see: https://electronics.stackexchange.com/q/71396
module Debouncer #(MS = 5, parameter CLOCK_FREQ = 100_000_000) (
    input wire clk,
    input wire unstable,
    output reg stable
);
    parameter DIV = CLOCK_FREQ / ((CLOCK_FREQ / 1_000) * MS);
    
    // Divide clock into new signal driven high for 10ns every N milliseconds (specified by MS)
    wire reclk;
    ClockDivider #(.DIV(DIV)) DebouncerDivider (.clk(clk), .reclk(reclk));
    
    reg [2:0] meta_state;
    always @(posedge clk) begin
        if (reclk) begin
            stable <= meta_state[2];
        end
        meta_state <= {meta_state[1:0], unstable};
    end
endmodule
