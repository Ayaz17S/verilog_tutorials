`timescale 1ns/1ps

module counter_tb;

    reg clear, clock;
    wire [0:7] count;

    // Instantiate the counter
    counter uut (
        .clear(clear),
        .clock(clock),
        .count(count)
    );

    // Clock generation: toggles every 5ns
    always #5 clock = ~clock;

    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0, counter_tb);

        // Initial conditions
        clock = 0;
        clear = 1;
        #10;

        clear = 0;  // Enable counting
        #100;

        clear = 1;  // Clear again
        #10;

        clear = 0;  // Count again
        #50;

        $finish;
    end

endmodule
