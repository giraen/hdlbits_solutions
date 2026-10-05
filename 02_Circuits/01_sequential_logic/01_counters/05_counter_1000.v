module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    wire [2:0][3:0] counts;
    
    assign c_enable[0] = 1;
    assign c_enable[1] = (counts[0] == 9) ? 1 : 0;
    assign c_enable[2] = ((counts[1] == 9) & (counts[0] == 9)) ? 1 : 0;
    
    bcdcount counter0 (clk, reset, c_enable[0], counts[0]);
    bcdcount counter1 (clk, reset, c_enable[1], counts[1]);
    bcdcount counter2 (clk, reset, c_enable[2], counts[2]);
    
    assign OneHertz = ({counts[2], counts[1], counts[0]} == 12'b1001_1001_1001) ? 1: 0;
endmodule
