module a_module (input x, input y, output z);
    assign z = (x ^ y) & x;
endmodule

module b_module ( input x, input y, output z );
    assign z = ~(x ^ y);
endmodule

module top_module (input x, input y, output z);
    wire [3:0] out;
    a_module a1(x, y, out[0]);
    b_module b1(x, y, out[1]);
    
    a_module a2(x, y, out[2]);
    b_module b2(x, y, out[3]);
    
    assign z = (out[0] | out[1]) ^ (out[2] & out[3]);
endmodule
