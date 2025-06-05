`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 15:25:22
// Design Name: 
// Module Name: tb_edge_detectors
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_edge_detectors;

reg clk = 0;
reg a = 0;
wire pos_pulse, neg_pulse, both_pulse;

edge_detectors uut (
    .clk(clk),
    .a(a),
    .pos_pulse(pos_pulse),
    .neg_pulse(neg_pulse),
    .both_pulse(both_pulse)
);

// Clock generation: 10 ns period
always #5 clk = ~clk;

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, tb_edge_detectors);

    #3  a = 1;   // Rising edge at 5 ns
    #10 a = 0;   // Falling edge at 15 ns
    #10 a = 1;   // Rising edge at 25 ns
    #10 a = 0;   // Falling edge at 35 ns
    #20 $finish;
end

endmodule


