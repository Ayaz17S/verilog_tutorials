module adder_or_subtractor (
   input  [3:0] a,
   input  [3:0] b,
   input        m,
   output [3:0] x,
   output       carry_out
);
    wire [3:0] Bin;
    wire       carry;

    assign Bin = (m) ? ~b : b;
    assign {carry, x} = a + Bin + m;
    assign carry_out = carry;

endmodule
