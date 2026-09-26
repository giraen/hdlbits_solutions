module cseladd (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
	
    wire [15:0] sum_lo;
    wire carry_sel;
    wire [15:0] sum_hi_0;
    wire [15:0] sum_hi_1;
    wire [15:0] sum_hi;
    
    add16 inst_0(.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sum_lo), .cout(carry_sel));
    add16 inst_1(.a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(sum_hi_0));
    add16 inst_2(.a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(sum_hi_1));
    
    always @(sum_hi_0, sum_hi_1, carry_sel) begin
        case (carry_sel)
           1'b0: sum_hi = sum_hi_0;
           1'b1: sum_hi = sum_hi_1;
        endcase
    end
    
    assign sum = {sum_hi, sum_lo};

endmodule