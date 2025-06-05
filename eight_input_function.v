`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 16:18:30
// Design Name: 
// Module Name: eight_input_function
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


module eight_input_muxed_output (
    input wire clk,       // Clock
    input wire rst,       // Asynchronous reset
    input wire sel,       // MUX select: 0 = combinational, 1 = sequential
    input wire a, b, c, d, e, f, g, h,  // 8 inputs
    output wire y         // Final output
);

    wire comb_out;
    reg seq_out;

    // Combinational logic (assign using gate-level operations)
    assign comb_out = ((a & b) | (c ^ d)) & (~e | f) ^ (g & ~h);

    // Sequential logic (register the same logic)
    always @(posedge clk or posedge rst) begin
        if (rst)
            seq_out <= 1'b0;
        else
            seq_out <= comb_out;
    end

    // MUX to select between combinational and sequential output
    assign y = (sel == 1'b0) ? comb_out : seq_out;

endmodule


