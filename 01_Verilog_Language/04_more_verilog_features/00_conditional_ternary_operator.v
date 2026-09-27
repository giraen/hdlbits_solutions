module conditional (
    input [7:0] a, b, c, d,
    output [7:0] min);

    wire [7:0] comp_1;
    wire [7:0] comp_2;
    
	assign comp_1 = a < b ? a : b;
    assign comp_2 = c < d ? c : d;
    assign min = comp_1 < comp_2 ? comp_1 : comp_2;
endmodule
