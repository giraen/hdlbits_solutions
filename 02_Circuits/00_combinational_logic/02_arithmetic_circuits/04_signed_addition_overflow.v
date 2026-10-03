module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
    wire [8:0] s_temp;
    
    assign s = a + b;
    assign overflow = (s[7] & ~a[7] & ~b[7]) | (~s[7] & a[7] & b[7]);

endmodule
