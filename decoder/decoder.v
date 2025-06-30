module decoder3x8 (
  input  [2:0] in,
  output [7:0] out
);

// Set the output bit corresponding to input value high (one-hot encoding)
assign out = 1 << in;


endmodule