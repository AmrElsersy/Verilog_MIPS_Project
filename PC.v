module PC( output1, input_pc);
input wire[12:0] input_pc;
output reg[12:0] output1;
always@(input_pc)
begin output1 <= input_pc; end
endmodule
