`timescale 1ns/1ns
`include "vector2.v"

module vector2_tb;

reg [31:0] IN;
wire [31:0] OUT;

vector2 dut(IN, OUT);

initial begin
    $dumpfile("vector2_tb.vcd");
    $dumpvars(0, vector2_tb);

    for (integer i = 0; i < 16; i++) begin
        IN = $urandom; #10;
    end
end

endmodule