`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2025 16:35:07
// Design Name: 
// Module Name: priority_encoder_4to2
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


module priority_encoder_4to2 (
    input  wire [3:0] in,     // 4-bit input
    output reg  [1:0] out,    // 2-bit encoded output
    output reg        valid   // Output valid flag
);

always @(*) begin
    valid = 1'b1;
    casex (in)
        4'b1xxx: out = 2'b11; // input[3] has highest priority
        4'b01xx: out = 2'b10; // input[2]
        4'b001x: out = 2'b01; // input[1]
        4'b0001: out = 2'b00; // input[0]
        default: begin
            out = 2'b00;
            valid = 1'b0; // No input is high
        end
    endcase
end

endmodule

