module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
	
    always @(posedge clk) begin
        if (reset) begin
            q <= 0;
        	ena <= 0;
        end
        else begin
            if (q[3:0] == 4'b1001) begin
                q[3:0] <= 4'b0000;
                q[7:4] <= (q[7:4] == 4'b1001) ? 4'b0000 : q[7:4] + 1;
            end
            else begin
                q[3:0] <= q[3:0] + 1;
                q[7:4] <= q[7:4];
            end
            
            if (q[7:0] == 8'b1001_1001) begin
                q[11:8] <= (q[11:8] == 4'b1001) ? 4'b0000 : q[11:8] + 1;
            end
            else begin
                q[11:8] <= q[11:8];
            end
            
            if (q[11:0] == 12'b1001_1001_1001) begin
                q[15:12] <= (q[15:12] == 4'b1001) ? 4'b0000 : q[15:12] + 1;
            end
            else begin
                q[15:12] <= q[15:12];
            end
            
            ena[3] <= (q[11:0] == 12'b1001_1001_1000) ? 1 : 0;
            ena[2] <= (q[7:0] == 8'b1001_1000) ? 1 : 0;
            ena[1] <= (q[3:0] == 4'b1000) ? 1 : 0;
        end
    end
endmodule
