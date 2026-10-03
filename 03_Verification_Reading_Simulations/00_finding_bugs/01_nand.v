module top_module (input a, input b, input c, output out);//
	wire out_temp;
    wire missing;
    assign missing = a & b & c;
    andgate inst1 ( .a(a), .b(b), .c(c), .d(missing), .e(missing), .out(out_temp) );
	assign out = ~out_temp;
endmodule
