module counter(clear,clock,count);
parameter N =7 ;
input clear,clock;
output [0:N]count; reg [0:N] count;

always @(negedge clock) begin
    if (clear) 
        count <=0;
        else 
        count<= count +1;
    
end
endmodule