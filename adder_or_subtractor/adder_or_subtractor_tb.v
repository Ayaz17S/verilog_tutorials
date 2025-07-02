`timescale 1ns/1ps
module adder_or_subtractor_tb;
reg [3:0] a,b;
reg m;
wire[3:0]x;
wire carry_out;

adder_or_subtractor uut(
    .a(a),
    .b(b),
    .m(m),
    .x(x),
    .carry_out(carry_out)
);

initial begin
    $dumpfile("adder_or_subtractor.vcd");
    $dumpvars(0,adder_or_subtractor_tb);
    $monitor("Time=%0t | A=%b B=%b Mode=%b => X=%b Carry=%b", $time, a, b, m, x, carry_out);

     a=4'b1001;
     b = 4'b0011;
     m =0;
     #10;
     m=1;
     a=4'b1111;
     b=4'b0111;
     #10;
     m=0;
     #10;
     $finish;
end
endmodule