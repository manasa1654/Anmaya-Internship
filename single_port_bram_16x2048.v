`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2025 17:07:45
// Design Name: 
// Module Name: single_port_bram_16x2048
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


module single_port_bram_16x2048 (
    input wire clk,
    input wire [10:0] addr,
    input wire we,
    input wire [15:0] din,
    output reg [15:0] dout
);

    (* ram_style = "block" *)  // Hint to use BRAM, not LUTRAM
    reg [15:0] mem [0:2047];

    always @(posedge clk) begin
        if (we)
            mem[addr] <= din;
        dout <= mem[addr];
    end

endmodule

