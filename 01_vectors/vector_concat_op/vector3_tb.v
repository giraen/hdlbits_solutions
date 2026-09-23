`timescale 1ns/1ns
`include "vector3.v"

module vector3_tb;

reg [29:0] IN;
wire [31:0] OUT;

integer errors = 0;

vector3 dut(
    IN[29:25], IN[24:20], IN[19:15], IN[14:10], IN[9:5], IN[4:0],
    OUT[31:24], OUT[23:16], OUT[15:8], OUT[7:0]
);

initial begin
    $dumpfile("vector3_tb.vcd");
    $dumpvars(0, vector3_tb);

    for (integer i = 0; i < 2**4; i++) begin
        IN = $urandom; #10;

        if (OUT !== {IN[29:25], IN[24:20], IN[19:15], IN[14:10], IN[9:5], IN[4:0], 2'b11}) begin
            errors = errors + 1;
        end
    end

    $display("Test complete");
    $display("Errors: %0d", errors);
end

endmodule