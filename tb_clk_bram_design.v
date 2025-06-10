`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2025 13:31:37
// Design Name: 
// Module Name: tb_clk_bram_design
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



module tb_clk_bram_design;

    reg clk_in1;
    reg reset;
    wire clk_out_30M;
    wire clk_out_100M;
    wire locked;
    wire [9:0] wr_addr;
    wire [9:0] wr_data;
    wire [9:0] rd_data;
    wire [9:0] rd_addr;

    // Instantiate the DUT (Device Under Test)
    clk_bram_design uut (
        .clk_in1(clk_in1),
        .reset(reset),
        .clk_out_30M(clk_out_30M),
        .clk_out_100M(clk_out_100M),
        .locked(locked),
        .wr_addr(wr_addr),
        .wr_data(wr_data),
        .rd_data(rd_data),
        .rd_addr(rd_addr)
    );

    // Generate input clock (70 MHz)
    initial clk_in1 = 0;
    always #7.14 clk_in1 = ~clk_in1;

     initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, tb_clk_bram_design);
end

    // Apply reset
    initial begin
        reset = 1;
        #100;
        reset = 0;
    end

    // Display monitored signals after PLL lock
    initial begin
        wait(locked == 1);
        $display("LOCKED HIGH at time: %0t", $time);
        $monitor("Time: %0t | wr_addr: %0d | wr_data: %0d | rd_addr: %0d | rd_data: %0d",
                  $time, wr_addr, wr_data, rd_addr, rd_data);
    end

    // End simulation after a certain time
    initial begin
        #50000; // 50 us
        $finish;
    end

endmodule

