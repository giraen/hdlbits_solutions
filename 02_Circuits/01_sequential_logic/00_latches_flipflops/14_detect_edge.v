module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] in_cpy;
    always @(posedge clk) begin
        in_cpy <= in;
        pedge <= in & ~in_cpy;
    end
    
endmodule
