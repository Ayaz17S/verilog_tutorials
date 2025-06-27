`timescale 1ns/1ps

module simple_counter_tb;

reg clk, rst;
wire [31:0] count;

simple_counter uut (
    .clk(clk),
    .rst(rst),
    .count(count)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0, simple_counter_tb);

    // Initial values
    clk = 0;
    rst = 1;
    #15;

    rst = 0;   // Release reset
    #100;

    rst = 1;   // Apply reset again
    #10;

    rst = 0;   // Release reset
    #50;

    $finish;
end

endmodule
