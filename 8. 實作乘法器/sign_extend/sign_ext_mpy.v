module MPY(a, b, product);
    input [3:0] a, b;
    wire [3:0] ab0, ab1, ab2, ab3;
    wire [7:0] add0, add1, add2, add3;
    wire [7:0] ext0, ext1, ext2, ext3;
    output [7:0] product;

    arrand and0(a, b[0], ab0);
    arrand and1(a, b[1], ab1);
    arrand and2(a, b[2], ab2);
    arrand and3(a, b[3], ab3);

    assign add0 = {{4{ab0[3]}}, ab0};
    assign add1 = {{3{ab1[3]}}, ab1, 1'b0};
    assign add2 = {{2{ab2[3]}}, ab2, 2'b0};
    assign add3 = {1'b0, ab3, 3'b0};
    assign ext0 = {{4{ab3[0]}}, 4'b0};
    assign ext1 = {{3{ab3[1]}}, 5'b0};
    assign ext2 = {{2{ab3[2]}}, 6'b0};

    assign product = add0 + add1 + add2 + add3 + ext0 + ext1 + ext2;
    

endmodule

module arrand(a, b, ab);
    input [3:0] a;
    input b;
    output [3:0] ab;

    assign ab[0] = a[0] & b;
    assign ab[1] = a[1] & b;
    assign ab[2] = a[2] & b;
    assign ab[3] = a[3] & b;
endmodule