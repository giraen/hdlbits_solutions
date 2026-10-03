module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
	
    always @(posedge clk) begin
        if (reset)
            q <= 0;
        else begin
            q <= slowena ? ((q == 9) ? 0 : q + 1) : q;
            
            /*
            // Original Version
            if (slowena) begin
                q <= (q == 9) ? 0 : q + 1;
            end 
            else begin
            	q <= q;
            end
            */
        end
    end
endmodule
