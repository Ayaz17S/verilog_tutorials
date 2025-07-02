module mux2x1 (
    input a,
    input b,
    input sel,
    output wire y  // Explicit wire (optional but recommended)
);
    assign y = (sel) ? b : a;
endmodule

module mux8x1 (
    input [7:0] in,      // 8 data inputs
    input [2:0] sel,     // 3-bit select line
    output wire y
);

    wire [3:0] stage1;
    wire [1:0] stage2;
    

mux2x1 m1(.a(in[0]), .b(in[1]),.sel(sel[0]),.y(stage1[0]));
mux2x1 m2 (.a(in[2]), .b(in[3]), .sel(sel[0]), .y(stage1[1]));
mux2x1 m3 (.a(in[4]), .b(in[5]), .sel(sel[0]), .y(stage1[2]));
mux2x1 m4 (.a(in[6]), .b(in[7]), .sel(sel[0]), .y(stage1[3]));    

mux2x1 m5(.a(stage1[0]), .b(stage1[1]), .sel(sel[1]), .y(stage2[0]));
mux2x1 m6 (.a(stage1[2]), .b(stage1[3]), .sel(sel[1]), .y(stage2[1]));

mux2x1 m7(.a(stage2[0]), .b(stage2[1]), .sel(sel[2]), .y(y));
endmodule

//testbench
module mux8x1_tb;
    reg [7:0] in;
    reg [2:0] sel;
    wire y;

    mux8x1 uut (
        .in(in),
        .sel(sel),
        .y(y)
    );

    initial begin
        $dumpfile("mux8x1.vcd");
        $dumpvars(0, mux8x1_tb);

        in = 8'b10101010;

        for (integer i = 0; i < 8; i = i + 1) begin
            sel = i;
            #10;
            $display("sel=%0d -> in[%0d]=%b, y=%b", sel, sel, in[sel], y);
        end

        $finish;
    end
endmodule
