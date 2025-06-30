`timescale 1ns/1ps
module decoder3x8_tb;
reg [2:0]in;
wire [7:0]out;

decoder3x8 uut(
    .in(in),
    .out(out)
);

initial begin
    $dumpfile("decoder3x8.vcd");
    $dumpvars(0,decoder3x8_tb);
end

initial begin
    $monitor("Time =%0t | in =%b | out =%b",$time,in,out);
end

initial begin
      in = 3'b000; #10;
    in = 3'b001; #10;
    in = 3'b010; #10;
    in = 3'b011; #10;
    in = 3'b100; #10;
    in = 3'b101; #10;
    in = 3'b110; #10;
    in = 3'b111; #10;
    $finish;
end
endmodule