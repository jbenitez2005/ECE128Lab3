module adder_display_top(
    input  [3:0] A, B,
    input        CI,
    output [6:0] seg,   // segments (a..g)
    output [3:0] an     // anodes
);
    wire [3:0] SUM;
    wire CO;

    // could use ripple_adder or the cla
    ripple_adder u_add(.A(A), .B(B), .CI(CI), .SUM(SUM), .CO(CO));

    // Drive decoder
    bcd7seg u_dec(.bcd(SUM), .seg(seg));

    // Enable rightmost digit (AN0), disable others
    assign an = 4'b1110;
endmodule
