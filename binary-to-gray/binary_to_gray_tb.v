`timescale 1ns/1ps

module binary_to_gray_tb;
    reg [3:0] a;
    wire [3:0] b;

    binary_to_gray uut (
        .a(a),
        .b(b)
    );

    initial begin
        $dumpfile("binary_to_gray.vcd");
        $dumpvars(0, binary_to_gray_tb);

        a = 4'b0000;  // <-- Initialize at time 0
    #5;
    a = 4'b1001;  // <-- Change value
    #5;
    end
endmodule
