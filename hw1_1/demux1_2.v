module demux1_2(Inp, S, OutA, OutB);
    input Inp;
    input S;

    output OutA;
    output OutB;

    wire notS;
    wire nandS_1, nandS_2;
    wire notNandS_1, notNandS_2;

    not1 N1(.in1(S), .out(notS));

    nand2 NA1(.in1(Inp), .in2(notS), .out(nandS_1));
    nand2 NA2(.in1(Inp), .in2(S), .out(nandS_2));

    not1 N2(.in1(nandS_1), .out(OutA));
    not1 N3(.in1(nandS_2), .out(OutB));

endmodule