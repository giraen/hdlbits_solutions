`timescale 1ns/1ns
`include "vectorr.v"

module vectorr_tb;

reg [7:0] IN;
wire [7:0] OUT;

integer errors = 0;

vectorr dut(IN, OUT);

initial begin
    $dumpfile("vectorr_tb.vcd");
    $dumpvars(0, vectorr_tb);

    IN = 8'b0000_0000; #10;
    for (integer i = 0; i < 2 ** 3; i++) begin
        IN = 2 ** i; #10;

        if (OUT !== 2**(7 - i)) begin
            errors = errors +  1;
        end
    end

    $display("Test complete. Errors: %0d", errors);
end

endmodule