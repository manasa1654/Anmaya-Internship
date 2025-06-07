`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2025 17:33:42
// Design Name: 
// Module Name: distributed_ram_256x32
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


module distributed_ram_256x32 (
    input wire clk,
    input wire [7:0] addr,         // 8-bit address = 256 locations
    input wire we,                 // write enable
    input wire [31:0] din,         // 32-bit data input
    output reg [31:0] dout         // 32-bit data output
);

    // Force LUT-based distributed RAM
    (* ram_style = "distributed" *)
    reg [31:0] mem [0:255];

    always @(posedge clk) begin
        if (we)
            mem[addr] <= din;
        dout <= mem[addr];
    end

endmodule

