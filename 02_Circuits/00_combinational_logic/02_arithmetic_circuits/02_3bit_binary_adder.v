module fadd ( 
    input a, b, cin,
    output cout, sum );
    assign cout = (a & b) | (cin & (a ^ b));
    assign sum = a ^ b ^ cin;
endmodule

module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
	
    generate 
        genvar i;

        for (i = 0; i < 3; i++) begin: add_n
            if (i == 0)
                fadd fadd_n(.a(a[i]), .b(b[i]), .cin(cin), .cout(cout[i]), .sum(sum[i]));
            else
                fadd fadd_n(.a(a[i]), .b(b[i]), .cin(cout[i - 1]), .cout(cout[i]), .sum(sum[i]));
        end
    endgenerate
endmodule
