module demux1_4(Inp, S, OutA, OutB, OutC, OutD);
    input Inp;
    input [1:0] S;

    output OutA;
    output OutB;
    output OutC;
    output OutD;

    wire Input1;
    wire Input2;

    demux1_2 init(.Inp(Inp), .S(S[1]), .OutA(Input1), .OutB(Input2));
    demux1_2 first(.Inp(Input1), .S(S[0]), .OutA(OutA), .OutB(OutB));
    demux1_2 second(.Inp(Input2), .S(S[0]), .OutA(OutC), .OutB(OutD));

endmodule