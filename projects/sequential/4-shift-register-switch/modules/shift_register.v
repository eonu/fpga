module ShiftRegister #(parameter WIDTH = 16, parameter DIV = 4) (
    input wire clk_100MHz,
    input wire serial_in,
    output reg [WIDTH-1:0] parallel_out
);
    // Divide clock into new signal driven high for 10ns at 4Hz
    wire reclk;
    ClockDivider #(.DIV(DIV)) Divider (.clk(clk_100MHz), .reclk(reclk));
    
    // Shift flip-flop values every 0.25s
    reg [WIDTH-1:0] values = {{WIDTH - 1} {1'b0}};
    always @(posedge clk_100MHz) begin
        if (reclk) begin
            values <= {serial_in, values[WIDTH-1:1]};
        end
        parallel_out <= values;
    end
endmodule
