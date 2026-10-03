module bcdadd100 #(parameter N = 100) ( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
	
    wire [399:0] carry;
    generate
        genvar i;
        
        for (i = 0; i < N*4; i = i + 4) begin: fa_bcd
            if (i == 0)
                bcd_fadd bcd_fa (a[i+3:i], b[i+3:i], cin, carry[i], sum[i+3:i]);
        	else
                bcd_fadd bcd_fa (a[i+3:i], b[i+3:i], carry[i-4], carry[i], sum[i+3:i]);
        end
    endgenerate
    
    assign cout = carry[396];
endmodule
