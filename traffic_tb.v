
`timescale 1ns/1ps

module traffic_tb;

    reg clk, reset;
    wire [2:0] NS, EW;

    // Instantiate DUT (Design Under Test)
    traffic_light uut (
        .clk(clk),
        .reset(reset),
        .NS(NS),
        .EW(EW)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;

        // Apply reset
        #10;
        reset = 0;

        // Run simulation
        #200;

        $stop;
    end

    // Monitor values in console (optional but useful)
    initial begin
        $monitor("Time=%0t | Reset=%b | NS=%b | EW=%b", 
                  $time, reset, NS, EW);
    end

endmodule