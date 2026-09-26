module addsub (
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    
    wire [31:0] b_new;
    wire [15:0] sum_lo;
    wire [15:0] sum_hi;
    wire carry;
    
    assign b_new = b ^ {32{sub}};
    
    add16 inst_0(.a(a[15:0]), .b(b_new[15:0]), .cin(sub), .sum(sum_lo), .cout(carry));
    add16 inst_1(.a(a[31:16]), .b(b_new[31:16]), .cin(carry), .sum(sum_hi));
    
    assign sum = {sum_hi, sum_lo};
endmodule
