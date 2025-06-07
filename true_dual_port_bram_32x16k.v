`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2025 17:15:54
// Design Name: 
// Module Name: true_dual_port_bram_32x16k
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

module true_dual_port_bram_32x16k (
    input wire clk_a,                    // Clock for Port A
    input wire clk_b,                    // Clock for Port B

    // Port A
    input wire [13:0] addr_a,
    input wire [31:0] din_a,
    input wire we_a,
    output reg [31:0] dout_a,

    // Port B
    input wire [13:0] addr_b,
    input wire [31:0] din_b,
    input wire we_b,
    output reg [31:0] dout_b
);

    // Force Block RAM inference
    (* ram_style = "block" *) reg [31:0] mem [0:16383];

    // Port A
    always @(posedge clk_a) begin
        if (we_a)
            mem[addr_a] <= din_a;
        dout_a <= mem[addr_a];
    end

    // Port B
    always @(posedge clk_b) begin
        if (we_b)
            mem[addr_b] <= din_b;
        dout_b <= mem[addr_b];
    end

endmodule

