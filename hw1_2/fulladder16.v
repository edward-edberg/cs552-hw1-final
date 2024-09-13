module fulladder16(A,B, S, Cout);
    input [15:0] A;
    input [15:0] B;

    output [15:0] S;
    output Cout;

    wire cin_0, cin_1, cin_2, cin_3;

    assign cin_0 = 0;

    fulladder4 ONE(.A(A[3:0]), .B(B[3:0]), .Cin(cin_0), .S(S[3:0]), .Cout(cin_1));
    fulladder4 TWO(.A(A[7:4]), .B(B[7:4]), .Cin(cin_1), .S(S[7:4]), .Cout(cin_2));
    fulladder4 THREE(.A(A[11:8]), .B(B[11:8]), .Cin(cin_2), .S(S[11:8]), .Cout(cin_3));
    fulladder4 FOUR(.A(A[15:12]), .B(B[15:12]), .Cin(cin_3), .S(S[15:12]), .Cout(Cout));

endmodule