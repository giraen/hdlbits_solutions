`timescale 1ns/1ns
`include "gates4.v"

module gates4_tb;

reg [3:0] IN;
wire [3:0] OUT_AND;
wire [3:0] OUT_OR;
wire [3:0] OUT_XOR;

gates4 dut(IN, OUT_AND, OUT_OR, OUT_XOR);

initial begin
    $dumpfile("gates4_tb.vcd");
    $dumpvars(0, gates4_tb);

    for (integer i = 0; i < 2 ** 4; i++) begin
        IN = i[3:0]; #10;
    end

    $display("Test complete");
end

endmodule