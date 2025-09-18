module full_adder(
    input  A, B, CI,
    output SUM, CO
);
    assign SUM = A ^ B ^ CI;
    assign CO  = (A & B) | (B & CI) | (A & CI);
endmodule
