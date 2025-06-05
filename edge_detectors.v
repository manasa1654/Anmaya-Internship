`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 18:30:09
// Design Name: 
// Module Name: edge_detectors
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


module edge_detectors (
    input clk,
    input a,
    output reg pos_pulse,
    output reg neg_pulse,
    output reg both_pulse
);

reg adelay = 0;
initial pos_pulse=0;
initial neg_pulse=0;
initial both_pulse=0;


always @(posedge clk) begin
    pos_pulse  <=  a & ~adelay;   // Rising edge
    neg_pulse  <= ~a &  adelay;   // Falling edge
    both_pulse <=  a ^  adelay;   // Any edge
    adelay     <=  a;             // Store previous value
end

endmodule

