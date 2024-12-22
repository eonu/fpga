`timescale 1ns / 1ps

module TestLEDSwitch();
    reg switch;
    wire led;
    
    LEDSwitch CUT (switch, led);

    initial begin
        switch = 0;  #100;
        switch = 1;  #100;
        switch = 0;  #100;
        $stop;
    end
endmodule
