module comparator #(parameter N = 4) (
    input  [N-1:0] A,
    input  [N-1:0] B,
    output         equal,
    output         greater,
    output         less
);
    assign equal   = (A == B);
    assign greater = (A > B);
    assign less    = (A < B);
endmodule
