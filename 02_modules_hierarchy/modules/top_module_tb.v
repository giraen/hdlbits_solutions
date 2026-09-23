`timescale 1ns/1ns
`include "top_module.v"

module top_module_tb;

reg IN1;
reg IN2;
wire OUT;

top_module dut(IN1, IN2, OUT);

initial begin
    $dumpfile("top_module_tb.vcd");
    $dumpvars(0, top_module_tb);

    IN1=0; IN2=1; #10;
    IN1=1; IN2=1; #10;
    IN1=0; IN2=1; #10;
    IN1=1; IN2=1; #10;
    
    IN1=0; IN2=1; #10;
    IN1=0; IN2=1; #10;
    
    IN1=0; IN2=0; #10;
    IN1=0; IN2=1; #10;
    IN1=0; IN2=0; #10;
    IN1=0; IN2=1; #10;

    $display("Test complete.");
end

endmodule