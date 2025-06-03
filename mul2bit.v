`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2025 18:03:58
// Design Name: 
// Module Name: mul2bit
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

module half_adder (
    input a,
    input b,
    output sum,
    output carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule
module mul2bit( input [1:0] A,
    input [1:0] B,
    output [3:0] P
);
wire t1, t2, t3;
    wire ha1_sum, ha1_carry;
    wire ha2_sum, ha2_carry;

    // Partial products
    assign P[0] = A[0] & B[0];
    assign t1 = A[1] & B[0];
    assign t2 = A[0] & B[1];
    assign t3 = A[1] & B[1];

    // First Half Adder: t1 + t2
    half_adder ha1 (
        .a(t1),
        .b(t2),
        .sum(ha1_sum),
        .carry(ha1_carry)
    );
    assign P[1] = ha1_sum;

    // Second Half Adder: t3 + ha1_carry
    half_adder ha2 (
        .a(t3),
        .b(ha1_carry),
        .sum(ha2_sum),
        .carry(ha2_carry)
    );
    assign P[2] = ha2_sum;
    assign P[3] = ha2_carry;
endmodule
