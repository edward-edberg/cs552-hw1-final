module fulladder4(A, B, Cin, S, Cout);
    input [3:0] A;
    input [3:0] B;
    input Cin;

    output [3:0] S;
    output Cout;

    wire cin_1, cin_2, cin_3;

    fulladder1 ONE(.A(A[0]), .B(B[0]), .Cin(Cin), .S(S[0]), .Cout(cin_1));
    fulladder1 TWO(.A(A[1]), .B(B[1]), .Cin(cin_1), .S(S[1]), .Cout(cin_2));
    fulladder1 THREE(.A(A[2]), .B(B[2]), .Cin(cin_2), .S(S[2]), .Cout(cin_3));
    fulladder1 FOUR(.A(A[3]), .B(B[3]), .Cin(cin_3), .S(S[3]), .Cout(Cout));

endmodule