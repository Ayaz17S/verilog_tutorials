`timescale 1ns/1ps

module parallel_adder_tb;

  // Declare testbench variables
  reg [7:0] in1, in2;
  reg cin;
  wire [7:0] sum;
  wire cout;

  // Instantiate the Unit Under Test (UUT)
  parallel_adder uut (
    .in1(in1),
    .in2(in2),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  initial begin
    // Dump VCD file for waveform viewing
    $dumpfile("parallel_adder.vcd");
    $dumpvars(0, parallel_adder_tb);

    $display("Time\t\tin1\tin2\tcin\t|\tsum\tcout");
    $monitor("%0dns\t%h\t%h\t%b\t|\t%h\t%b", $time, in1, in2, cin, sum, cout);

    // Test 1: Basic addition without carry-in
    in1 = 8'd5; in2 = 8'd10; cin = 0; #25;

    // Test 2: Basic addition with carry-in
    in1 = 8'd5; in2 = 8'd10; cin = 1; #25;

    // Test 3: Max values to test carry-out
    in1 = 8'hFF; in2 = 8'h01; cin = 0; #25;

    // Test 4: Overflow with carry-in
    in1 = 8'hFF; in2 = 8'hFF; cin = 1; #25;

    // Test 5: Random values
    in1 = 8'd120; in2 = 8'd100; cin = 0; #25;

    $finish;
  end

endmodule
