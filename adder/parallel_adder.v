`timescale 1ns/1ps
module parallel_adder(sum,cout,cin,in1,in2);
input[7:0] in1,in2;
input cin;
output[7:0] sum;
output cout;
assign #20 {cout,sum} = in1+in2+cin;
endmodule