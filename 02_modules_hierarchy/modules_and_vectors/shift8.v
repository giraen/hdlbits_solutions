module shift8 (
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);

    wire [7:0] q0;
    wire [7:0] q1;
    wire [7:0] q2;
    wire [7:0] q_out;
    
    my_dff8 dff8_1(.clk(clk), .d(d[7:0]), .q(q0[7:0]));
    my_dff8 dff8_2(.clk(clk), .d(q0[7:0]), .q(q1[7:0]));
    my_dff8 dff8_3(.clk(clk), .d(q1[7:0]), .q(q2[7:0]));
    
    always @(d, q0, q1, q2, sel) begin
        case (sel)
            2'b00: q_out = d;
            2'b01: q_out = q0;
            2'b10: q_out = q1;
            2'b11: q_out = q2;
        endcase
    end
    
    assign q = q_out;

endmodule