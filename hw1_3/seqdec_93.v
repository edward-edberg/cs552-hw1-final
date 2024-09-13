module seqdec_93(Inp, Clk, Reset, Out);
    input Inp;
    input Clk;
    input Reset;
    output Out;

    wire q1, q2, q3, q4, q5, q6, q7, q8, norQ7Q6, norQ4Q3, notQ8Q5, notQ2Q1, q1Q2Q5Q8, notResult , result, final;

    dff dff1(.q(q1), .d(Inp), .clk(Clk), .rst(Reset));
    dff dff2(.q(q2), .d(q1), .clk(Clk), .rst(Reset));
    dff dff3(.q(q3), .d(q2), .clk(Clk), .rst(Reset));
    dff dff4(.q(q4), .d(q3), .clk(Clk), .rst(Reset));
    dff dff5(.q(q5), .d(q4), .clk(Clk), .rst(Reset));
    dff dff6(.q(q6), .d(q5), .clk(Clk), .rst(Reset));
    dff dff7(.q(q7), .d(q6), .clk(Clk), .rst(Reset));
    dff dff8(.q(q8), .d(q7), .clk(Clk), .rst(Reset));

    // assign Out = q8 & ~q7 & ~q6 &q5 & ~q4 & ~q3 & q2 & q1;

    nor2 nor1(.in1(q7), .in2(q6), .out(norQ7Q6));
    nor2 nor2(.in1(q4), .in2(q3), .out(norQ4Q3));

    // q8 norQ7Q6 q5 norQ4Q3 q2 q1
    //  norQ7Q6  norQ4Q3 

    // q8 q5
    nand2 nand1(.in1(q8), .in2(q5), .out(notQ8Q5));
    // q2 q1
    nand2 nand2(.in1(q2), .in2(q1), .out(notQ2Q1));
    // q8 q5 q2 q1
    nor2 nor3 (.in1(notQ8Q5), .in2(notQ2Q1), .out(q1Q2Q5Q8));

    //  norQ7Q6  norQ4Q3 
    nand2 nand3(.in1(norQ7Q6), .in2(norQ4Q3), .out(notResult));

    // Q7Q6Q4Q3
    not1 not1(.in1(notResult), .out(result));

    // combine q1Q2Q5Q8 Q7Q6Q4Q3
    nand2 nand4(.in1(q1Q2Q5Q8), .in2(result), .out(final));

    // final not
    not1 not2(.in1(final), .out(Out));
endmodule