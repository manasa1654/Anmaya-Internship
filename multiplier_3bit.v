`timescale 1ns / 1ps

module half_adder(
    input a, b,
    output sum, carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

module multiplier_3bit (
    input [2:0] A, B,
    output [5:0] P
);

    // Partial products
    wire ab00 = A[0] & B[0];
    wire ab01 = A[1] & B[0];
    wire ab02 = A[2] & B[0];

    wire ab10 = A[0] & B[1];
    wire ab11 = A[1] & B[1];
    wire ab12 = A[2] & B[1];

    wire ab20 = A[0] & B[2];
    wire ab21 = A[1] & B[2];
    wire ab22 = A[2] & B[2];

    // Intermediate sums and carries
    wire s1, c1;
    wire s2, c2;
    wire s3, c3;
    wire s4, c4;
    wire s5, c5;
    wire s6, c6;
    wire s7, c7;
    wire s8, c8;
    wire s9, c9;
    wire s10, c10;
    wire c11, c12, c13, c14;
    wire s11;



    // P[0]
    assign P[0] = ab00;

    // P[1]
half_adder ha1(ab01, ab10, s1, c1);
assign P[1] = s1;

    // P[2]= ab02+ab11+ab20+c1
half_adder ha2(ab02, ab11, s2, c2);
half_adder ha3(s2, ab20, s3, c3);
half_adder ha4(s3, c1, P[2], c4);

    // P[3]= ab12+ab21+c2+c3+c4
half_adder ha5(ab12, ab21, s4, c5);  // ab12 + ab21
half_adder ha6(s4, c2, s5, c6);      // + c2
half_adder ha7(s5, c3, s6, c7);      // + c3
half_adder ha8(s6, c4, P[3], c8);    // + c4

    // P[4]= ab22 + c5 + c6 + c7 + c8
half_adder ha9(ab22, c5, s7, c9);     // ab22 + c5
half_adder ha10(s7, c6, s8, c10);     // + c6
half_adder ha11(s8, c7, s9, c11);     // + c7
half_adder ha12(s9, c8, P[4], c12);   // + c8



// P[5] = c9 + c10 + c11 + c12
half_adder ha13(c9, c10, s10, c13);
half_adder ha14(s10, c11, s11, c14);
half_adder ha15(s11, c12, P[5], /* final carry ignored */);

endmodule
