`timescale 1ns / 1ps

module TestLEDSwitchAND();
    reg switch_a, switch_b;
    wire led;
    
    LEDSwitchAND CUT (switch_a, switch_b, led);
    
    initial begin
        switch_a = 0; switch_b = 0;  #100;
        switch_a = 1;  #100;
        switch_b = 1;  #100;
        switch_a = 0;  #100;
        switch_b = 0;  #100;
        switch_a = 1;  #100;
        switch_b = 1;  #100;
        switch_a = 0; switch_b = 0;  #100;
        $stop;
    end
endmodule
