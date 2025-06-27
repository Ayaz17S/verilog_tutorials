`timescale 1 ns/1ps
module or_gate_tb;

reg x,y;
wire f;
or_gate uut(
    .x(x),
    .y(y),
    .f(f)
);

initial 
     begin
        $dumpfile("or_gate.vcd");
        $dumpvars(0,or_gate_tb);

        $display("Time\t x y |f");
        $monitor("%0dns\t %b %b | %b", $time, x ,y, f);

    // Test all input combinations
    x = 0; y = 0; #10;
    x = 0; y = 1; #10;
    x = 1; y = 0; #10;
    x = 1; y = 1; #10;

    $finish;
end

endmodule