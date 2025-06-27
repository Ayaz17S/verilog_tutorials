// testbench.v
module testbench;
  reg a, b;
  wire f;

  and_gate uut(f, a, b);  // Instantiate the design

  initial begin
    $dumpfile("wave.vcd");     // Create VCD file
    $dumpvars(0, testbench);   // Dump all variables in testbench

    // Apply stimulus
    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;

    $finish;
  end
endmodule
