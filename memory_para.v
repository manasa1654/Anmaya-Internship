`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2025 16:35:44
// Design Name: 
// Module Name: memory_para
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


module memory_para #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 10
)(
    input clk,
    input we,
    input [ADDR_WIDTH-1:0] addr,
    input [DATA_WIDTH-1:0] din,
    output [DATA_WIDTH-1:0] dout
);

    reg [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];

    always @(posedge clk) begin
        if (we) begin
            mem[addr] <= din;
        end
    end

    assign dout = mem[addr];

endmodule

