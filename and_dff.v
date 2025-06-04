`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2025 15:10:28
// Design Name: 
// Module Name: and_dff
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


module and_dff (
    input wire clk,     // Clock signal
    input wire a,       // Input A to AND gate
    input wire b,       // Input B to AND gate
    output reg q        // Output from D flip-flop
);

    wire d;             // D input to flip-flop

    // AND gate output
    assign d = a & b;

    // D Flip-Flop: stores AND result on rising edge of clock
    always @(posedge clk) begin
        q <= d;
    end

endmodule

