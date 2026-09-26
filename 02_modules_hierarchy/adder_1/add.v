module add (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire carry;
    wire [15:0] sum_lo;
    wire [15:0] sum_hi;

    add16 add16_0(.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(sum_lo), .cout(carry));
    add16 add16_1(.a(a[31:16]), .b(b[31:16]), .cin(carry), .sum(sum_hi));

    assign sum = {sum_hi, sum_lo};
endmodule
