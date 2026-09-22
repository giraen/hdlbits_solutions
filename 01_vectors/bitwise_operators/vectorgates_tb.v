`timescale 1ns/1ns
`include "vectorgates.v"

module vectorgates_tb;

reg [2:0] A;
reg [2:0] B;
wire [2:0] OUT_OR_BITWISE;
wire [2:0] OUT_OR_LOGICAL;
wire [5:0] OUT_NOT;

integer count = 0;

vectorgates dut(A, B, OUT_OR_BITWISE, OUT_OR_LOGICAL, OUT_NOT);

initial begin
    $dumpfile("vectorgates_tb.vcd");
    $dumpvars(0, vectorgates_tb);

    A = 3'b000;
    B = 3'b000;
    for (integer i = 0; i < 2 ** 3; i++) begin
        A = i[2:0]; #10;

        if (i === 7 && count < 3) begin
            if (i == 7) begin
                B = ~B;
            end

            i = 0;
            A = i[2:0];
            count = count + 1;
        end

        if (i === 0) begin
            B = ~B; #10;
        end
    end

    $display("Test complete");
end

endmodule