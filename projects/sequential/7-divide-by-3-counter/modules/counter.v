module Counter(
    input wire clk,
    input wire up,
    input wire down,
    input wire reset,
    output reg div,
    output reg [3:0] anodes,
    output reg [7:0] cathodes
);
    // Initialize output value
    reg signed [7:0] value = 8'b0;
    
    // Initialize seven-segment display
    wire [3:0] digits;
    wire [7:0] segments;
    FullSevenSegmentDisplay Display (.clk(clk), .value(value), .anodes(digits), .cathodes(segments));
    
    // Initialize button debouncers
    wire up_stable, down_stable, reset_stable;
    reg pressed, up_pressed, down_pressed, reset_pressed = 1'b0;
    Debouncer IncrementDebouncer (.clk(clk), .unstable(up), .stable(up_stable));
    Debouncer DecrementDebouncer (.clk(clk), .unstable(down), .stable(down_stable));
    Debouncer ResetDebouncer (.clk(clk), .unstable(reset), .stable(reset_stable));
    
    // Divide clock into new signal driven high for 10ns every 10ms milliseconds
    wire reclk;
    parameter MS = 10;
    parameter CLOCK_FREQ = 100_000_000;
    parameter DIV = CLOCK_FREQ / ((CLOCK_FREQ / 1_000) * MS);
    ClockDivider #(.DIV(DIV)) ButtonDivider (.clk(clk), .reclk(reclk));
    
    // FSM states and initialization
    parameter S0 = 2'd0;
    parameter S1 = 2'd1;
    parameter S2 = 2'd2;
    reg [1:0] state, next_state = S0;
    
    always @(posedge clk) begin
        if (reclk) begin
            // Increment button logic
            if (up_stable) begin
                if (~up_pressed)
                    value <= value + 8'b1;
                    up_pressed <= 1'b1;
            end else
                up_pressed <= 1'b0;
                
            // Decrement button logic
            if (down_stable) begin
                if (~down_pressed)
                    value <= value - 8'b1;
                    down_pressed <= 1'b1;
            end else
                down_pressed <= 1'b0;
            
            // Reset button logic
            if (reset_stable) begin
                if (~reset_pressed)
                    value <= 8'b0;
                    reset_pressed <= 1'b1;
            end else
                reset_pressed <= 1'b0;
                
            // Indicates whether any button was pressed
            pressed <= up_pressed | down_pressed | reset_pressed;

            // FSM state update
            state = next_state; 
        end 
        
        // Set display values
        anodes <= digits;
        cathodes <= segments;
    end
    
    // FSM transition logic
    always @(posedge pressed) begin
        if (up_pressed)
            case (state)
                S0: next_state <= S1;
                S1: next_state <= S2;
                S2: next_state <= S0;
                default: next_state <= state;
            endcase
        if (down_pressed)
            case (state)
                S0: next_state <= S2;
                S1: next_state <= S0;
                S2: next_state <= S1;
                default: next_state <= state;
            endcase
        if (reset_pressed)
            next_state <= S0;
    end

    // FSM output logic
    always @(*)
        case (state)
            S0: div = 1'b1;
            S1: div = 1'b0;
            S2: div = 1'b0;
            default: div = 1'b0;
        endcase
endmodule
