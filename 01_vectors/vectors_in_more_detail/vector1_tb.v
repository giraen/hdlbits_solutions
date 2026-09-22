`timescale 1ns/1ps
`include "vector1.v"

module vector1_tb;

reg [15:0] IN;
wire [7:0] OUT_HI;
wire [7:0] OUT_LO;

vector1 dut(IN, OUT_HI, OUT_LO);

initial begin
    $dumpfile("vector1_tb.vcd");
    $dumpvars(0, vector1_tb);

    IN = 16'b0000_0000_0000_0000; #10;
    for (integer i = 0; i < 2 ** 16; i++) begin
        IN = i[15:0]; #10;
    end

    $display("Test complete");
end

endmodule