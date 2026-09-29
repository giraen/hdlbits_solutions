module fadd ( 
    input a, b, cin,
    output cout, sum );
    assign cout = (a & b) | (cin & (a ^ b));
    assign sum = a ^ b ^ cin;
endmodule


module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
	
    wire [3:0] carry;
    generate 
        genvar i;
        
        for (i = 0; i < 4; i++) begin: add_n
            if (i == 0)
                fadd add(.a(x[i]), .b(y[i]), .cin(1'b0), .cout(carry[i]), .sum(sum[i]));
            else
                fadd add(.a(x[i]), .b(y[i]), .cin(carry[i - 1]), .cout(carry[i]), .sum(sum[i]));
        end
    endgenerate
    assign sum[4] = carry[3];
endmodule
