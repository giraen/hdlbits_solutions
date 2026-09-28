module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );

    always @(*) begin
        for (int i = 0; i < 100; i++) begin
            if (i < 99)
                out_both[i] = in[i] & in[i + 1];
            
            if (i > 0)
                out_any[i] = in[i] | in[i - 1];
            
            if (i == 99)
                out_different[i] = in[i] ^ in[0];
            else
                out_different[i] = in[i] ^ in[i + 1];
        end
    end
endmodule
