module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
	
    always @(posedge clk) begin
        if (reset)
            q <= 4'b0001;
        else begin
            q <= (q[3] & ~q[2] & q[1] & ~q[0]) ? 4'b0001 : q + 1; 
        end
    end
endmodule
