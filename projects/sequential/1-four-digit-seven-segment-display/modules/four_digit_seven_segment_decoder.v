`timescale 1us / 1ps

/* Four-digit seven-segment display decoder
 * ----------------------------------------
 * Converts up to four 4-bit values into seven-segment display cathode outputs.
 * As a common anode is used to select a single digit to display,
 * a refresh scheme is required in order to render multiple digits simultaneously
 * (to the human eye). The chosen refresh scheme is 62.5Hz, with each digit being 
 * displayed for 4ms over a full 16ms cycle. The Basys3 board provides a single 
 * 100MHz clock, which is divided down into the appropriate frequency using an 
 * enable generator. Digit cycling is managed by a state machine, which makes 
 * the display a sequential circuit. */

module FourDigitSevenSegmentDecoder(
    // 100MHz oscillator
    input wire clk_100MHz,
    
    // 4-bit values for each digit to decode
    input wire [3:0] v3, v2, v1, v0,

    // 4-bit indicator to specify which digits to show
    input wire [3:0] digits,

    /* Whether or not to decode to decimal.
     * - If 0, values 0-15 are decoded into hexadecimal 0-F
     * - If 0, values 0-9 are decoded into decimal 0-9 and values 10-15 into - */
    input wire decimal,
    
    // Anode outputs - AN0, AN1, AN2, AN3
    output reg [3:0] anodes,

    // Cathode outputs - CA, CB, CC, CD, CE, CF, CG, DP
    output reg [7:0] cathodes
);
    // Enable generator - trigger every 4ms using 100MHz clock
    // 0.004 (4ms) * 100_000_000 (100MHz) = 400,000 cycles
    // ceil(log2(400_000)) = 19-bit counter required
    reg reclk;
    reg [18:0] counter = 19'd0;
    always @(negedge clk_100MHz) begin
        reclk <= 0;
        if (counter == 19'd400_000) begin
            reclk <= 1;
            counter <= 1;
        end 
        else
            counter <= counter + 1;
    end
    
    // State machine - state indicators
    parameter s3 = 4'b1000;
    parameter s2 = 4'b0100;
    parameter s1 = 4'b0010;
    parameter s0 = 4'b0001;

    reg [3:0] state;  // Current state (one-hot encoding)
    reg [1:0] idx;  // Current state (numerical index) 
    reg [3:0] value;  // Current displayed value
    wire [7:0] segments;  // Cathode outputs

    // Instantiate decoder module
    SevenSegmentDecoder SingleDigitDecoder (
    .value(value), 
    .decimal(decimal), 
    .segments(segments)
    );
    
    // State machine - initialization
    initial begin
        state = s0;
        idx = 2'd0;
        value = 4'b0;
    end
    
    // State machine - state output logic
    always @(state) begin
        case (state)
            s0: begin
                value = v0;
                idx = 2'd0;
//                anodes = enable[2'd0] ? ~state: ~4'b0;
//                cathodes = enable[2'd0] ? segments: ~8'b0;
            end
            s1: begin
                value = v1;
                idx = 2'd1;
//                anodes = enable[2'd1] ? ~state: ~4'b0;
//                cathodes = enable[2'd1] ? segments: ~8'b0;
            end
            s2: begin
                value = v2;
                idx = 2'd2;
//                anodes = enable[2'd2] ? ~state: ~4'b0;
//                cathodes = enable[2'd2] ? segments: ~8'b0;
            end
            s3: begin
                value = v3;
                idx = 2'd3;
//                anodes = enable[2'd3] ? ~state: ~4'b0;
//                cathodes = enable[2'd3] ? segments: ~8'b0;
            end
            default: begin
                value = 4'b0;
                idx = 2'd0;
//                anodes = ~4'b0;
//                cathodes = ~8'b0;
            end
        endcase
        anodes = digits[idx] ? ~state : ~4'b0;
        cathodes = digits[idx] ? segments : ~8'b0;
    end
    
    // State machine - state transition logic
    always @(posedge clk_100MHz) begin
        /* NOTE: 
         * Not using reclk as clock, e.g. always @(posedge reclk)
         * in order to avoid dividing clock down in logic.
         * See: https://www.reddit.com/r/FPGA/comments/o9z0gm/comment/h3fv1rm */
        if (reclk) begin
            case (state)
                s0: state = s1;
                s1: state = s2;
                s2: state = s3;
                s3: state = s0;
                default: state = s0;
            endcase
        end
    end
endmodule
