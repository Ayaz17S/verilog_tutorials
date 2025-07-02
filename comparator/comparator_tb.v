`timescale 1ns/1ps

module comparator_tb;

    reg  [3:0] A, B;
    wire       equal, greater, less;

    // Instantiating the comparator with 4-bit width
    comparator #(4) uut (
        .A(A),
        .B(B),
        .equal(equal),
        .greater(greater),
        .less(less)
    );

    initial begin
        $dumpfile("comparator.vcd");
        $dumpvars(0, comparator_tb);
        $monitor("Time=%0t | A=%b B=%b => Equal=%b Greater=%b Less=%b", 
                  $time, A, B, equal, greater, less);

        // Test Case 1: A == B
        A = 4'b1010; B = 4'b1010;
        #10;

        // Test Case 2: A > B
        A = 4'b1100; B = 4'b1000;
        #10;

        // Test Case 3: A < B
        A = 4'b0011; B = 4'b0110;
        #10;

        $finish;
    end
endmodule
