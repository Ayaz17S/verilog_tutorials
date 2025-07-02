`timescale 1ns/1ps

module d_flipflop_tb;
reg d, clk,reset;
wire q;

d_flipflop uut(
    .d(d),
    .clk(clk),
    .reset(reset),
    .q(q)
);

always #5 clk = ~clk;  // Toggle clock every 5 ns

initial begin
    $dumpfile("d_flipflop.vcd");
    $dumpvars(0, d_flipflop_tb);  // Corrected this line

    d = 0;
    clk = 0;
    reset =0;

    #10;
    d = 1;

    #40;
    d = 0;

    #20;
    d = 1;
    reset=1;
    #20;
    reset=0;
    #20;
    $finish;  // Added missing semicolon
end
endmodule
