// === Module ===
module up_down_counter (
   input mode,
   input clr,
   input ld,
   input [7:0] d_in,
   input clk,
   output reg [7:0] count
);

always @(posedge clk) begin
    if (ld) count <= d_in;
    else if (clr) count <= 0;
    else if (mode) count <= count + 1;
    else count <= count - 1;
end

endmodule
