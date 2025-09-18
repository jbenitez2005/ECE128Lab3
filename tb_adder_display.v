// tb_adder_display.sv
`timescale 1ns / 1ps

module tb_adder_display;

    // Inputs
    reg [3:0] A, B;
    reg CI;

    // Outputs
    wire [6:0] seg;
    wire [3:0] an;

    // Instantiate the top-level design
    adder_display_top uut (
        .A(A),
        .B(B),
        .CI(CI),
        .seg(seg),
        .an(an)
    );

    initial begin
        // Monitor signals
        $monitor("Time=%0t | A=%d B=%d CI=%b | SUM=%d | seg=%b an=%b",
                  $time, A, B, CI, (A+B+CI), seg, an);

        // Test valid BCD sums 0–9
        A=4'd2; B=4'd3; CI=0; #10;   // Expect SUM=5 → "5"
        A=4'd1; B=4'd8; CI=0; #10;   // Expect SUM=9 → "9"
        A=4'd4; B=4'd5; CI=0; #10;   // Expect SUM=9 → "9"
        A=4'd0; B=4'd7; CI=0; #10;   // Expect SUM=7 → "7"
        A=4'd6; B=4'd3; CI=0; #10;   // Expect SUM=9 → "9"

        // Test invalid BCD (≥10 → blank)
        A=4'd9; B=4'd2; CI=0; #10;   // Expect SUM=11 → blank (seg=1111111)
        A=4'd8; B=4'd8; CI=0; #10;   // Expect SUM=16 → blank

        // Done
        $finish;
    end

endmodule
