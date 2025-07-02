`timescale 1ns/1ps

module up_down_counter_tb;
reg [7:0] d_in;
reg mode, clr, clk, ld;
wire [7:0] count;

up_down_counter uut (
    .mode(mode),
    .clr(clr),
    .ld(ld),
    .d_in(d_in),
    .clk(clk),
    .count(count)
);

// Fixed signal name from `clock` to `clk`
always #5 clk = ~clk;

initial begin
    $dumpfile("up_down_counter.vcd");
    $dumpvars(0, up_down_counter_tb);

    // Initialize
    clk = 0;
    clr = 1;
    ld = 0;
    mode = 0;
    d_in = 8'd1;

    #10;
    clr = 0;
    ld = 1;

    #10;
    ld = 0;

    // Count up
    mode = 1;
    #40;

    // Count down
    mode = 0;
    #40;

    $finish;
end
endmodule
