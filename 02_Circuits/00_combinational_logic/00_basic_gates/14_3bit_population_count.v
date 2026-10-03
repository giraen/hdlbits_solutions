module ha (
	input a, b,
    output cout, sum
);
    assign sum = a ^ b;
    assign cout = a & b;
endmodule

module fa (
	input a, b, cin,
    output cout, sum
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));
endmodule

module top_module( 
    input [2:0] in,
    output [1:0] out );
	
    wire [1:0] cout;
    wire [1:0] sum;
    wire carry;
    ha ha_0(.a(in[0]), .b(in[1]), .cout(cout[0]), .sum(sum[0]));
    ha ha_1(.a(in[2]), .b(1'b0), .cout(cout[1]), .sum(sum[1]));
    
    fa fa_0(.a(sum[0]), .b(sum[1]), .cin(1'b0), .cout(carry), .sum(out[0]));
    fa fa_1(.a(cout[0]), .b(cout[1]), .cin(carry), .sum(out[1]));
endmodule
