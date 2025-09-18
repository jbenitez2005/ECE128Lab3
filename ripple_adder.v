module ripple_adder(
    input  [3:0] A, B,
    input        CI,
    output [3:0] SUM,
    output       CO
);
    wire c1, c2, c3;
    full_adder fa0(A[0], B[0], CI,  SUM[0], c1);
    full_adder fa1(A[1], B[1], c1,  SUM[1], c2);
    full_adder fa2(A[2], B[2], c2,  SUM[2], c3);
    full_adder fa3(A[3], B[3], c3,  SUM[3], CO);
endmodule
