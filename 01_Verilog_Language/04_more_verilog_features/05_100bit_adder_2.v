module fulladder1 (
    input a, b, cin,
    output sum, cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));
endmodule

module top_module #(parameter N=100) ( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    generate
        genvar i;
        for (i = 0; i < N; i++) begin: fa
            if (i == 0)
            	fulladder1 fadd (a[i], b[i], cin, sum[i], cout[i]);
            else
                fulladder1 fadd (a[i], b[i], cout[i - 1], sum[i], cout[i]);
        end
    endgenerate
endmodule