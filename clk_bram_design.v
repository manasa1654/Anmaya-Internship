`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2025 17:19:54
// Design Name: 
// Module Name: clk_bram_design
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
module clk_bram_design (
    input wire clk_in1,
    input wire reset,
    output wire clk_out_30M,
    output wire clk_out_100M,
    output wire locked,
    output wire [9:0] wr_addr,
    output wire [9:0] wr_data,
    output wire [9:0] rd_data,
    output reg [9:0] rd_addr // `reg` because it's driven by always block
);

// Write-side: 30 MHz 
reg [9:0] counter_out;

// Clock generation
clk_wiz_0 u_clk_gen (
    .clk_in1(clk_in1),
    .reset(reset),
    .locked(locked),
    .clk_out_30M(clk_out_30M),
    .clk_out_100M(clk_out_100M)
);

// Write address counter
always @(posedge clk_out_30M or posedge reset) begin
    if (reset || !locked)
        counter_out <= 10'd0;
    else
        counter_out <= counter_out + 1'b1;
end

assign wr_addr = counter_out;
assign wr_data = counter_out << 1;

// Read address counter
always @(posedge clk_out_100M or posedge reset) begin
    if (reset || !locked)
        rd_addr <= 10'd0;
    else
        rd_addr <= rd_addr + 1'b1;
end

// BRAM instantiation - gated by `locked`
blk_mem_gen_0 u_bram (
    .clka(clk_out_30M),    // input wire clka
    .ena(locked),          // enable when clock is locked
    .wea(locked),          // write enable when locked
    .addra(wr_addr),       // input wire [9 : 0] addra
    .dina(wr_data),        // input wire [9 : 0] dina
    .clkb(clk_out_100M),   // input wire clkb
    .enb(locked),          // enable when clock is locked
    .addrb(rd_addr),       // input wire [9 : 0] addrb
    .doutb(rd_data)        // output wire [9 : 0] doutb
);

endmodule
