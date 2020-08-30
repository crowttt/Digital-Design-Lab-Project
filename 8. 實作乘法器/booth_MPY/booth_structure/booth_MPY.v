`include "FA.v"
`include "HA.v"
module MPY(clk, a, b, p);
    input clk;
    input [31:0] a, b;
    output [63:0] p;

    wire [32:0] add[31:0];

    wire [63:0] add0_ext;
    wire [62:0] add1_ext;
    wire [61:0] add2_ext;
    wire [60:0] add3_ext;
    wire [59:0] add4_ext;
    wire [58:0] add5_ext;
    wire [57:0] add6_ext;
    wire [56:0] add7_ext;
    wire [55:0] add8_ext;
    wire [54:0] add9_ext;
    wire [53:0] add10_ext;
    wire [52:0] add11_ext;
    wire [51:0] add12_ext;
    wire [50:0] add13_ext;
    wire [49:0] add14_ext;
    wire [48:0] add15_ext;
    wire [47:0] add16_ext;
    wire [46:0] add17_ext;
    wire [45:0] add18_ext;
    wire [44:0] add19_ext;
    wire [43:0] add20_ext;
    wire [42:0] add21_ext;
    wire [41:0] add22_ext;
    wire [40:0] add23_ext;
    wire [39:0] add24_ext;
    wire [38:0] add25_ext;
    wire [37:0] add26_ext;
    wire [36:0] add27_ext;
    wire [35:0] add28_ext;
    wire [34:0] add29_ext;
    wire [33:0] add30_ext;

    wire [62:0] s0;
    wire [61:0] s1;
    wire [60:0] s2;
    wire [59:0] s3;
    wire [58:0] s4;
    wire [57:0] s5;
    wire [56:0] s6;
    wire [55:0] s7;
    wire [54:0] s8;
    wire [53:0] s9;
    wire [52:0] s10;
    wire [51:0] s11;
    wire [50:0] s12;
    wire [49:0] s13;
    wire [48:0] s14;
    wire [47:0] s15;
    wire [46:0] s16;
    wire [45:0] s17;
    wire [44:0] s18;
    wire [43:0] s19;
    wire [42:0] s20;
    wire [41:0] s21;
    wire [40:0] s22;
    wire [39:0] s23;
    wire [38:0] s24;
    wire [37:0] s25;
    wire [36:0] s26;
    wire [35:0] s27;
    wire [34:0] s28;
    wire [33:0] s29;
    wire [32:0] s30;

    booth_add booth1(a, {b[0],1'b0}, add[0]);
    booth_add booth2(a, b[1:0], add[1]);
    booth_add booth3(a, b[2:1], add[2]);
    booth_add booth4(a, b[3:2], add[3]);
    booth_add booth5(a, b[4:3], add[4]);
    booth_add booth6(a, b[5:4], add[5]);
    booth_add booth7(a, b[6:5], add[6]);
    booth_add booth8(a, b[7:6], add[7]);
    booth_add booth9(a, b[8:7], add[8]);
    booth_add booth10(a, b[9:8], add[9]);
    booth_add booth11(a, b[10:9], add[10]);
    booth_add booth12(a, b[11:10], add[11]);
    booth_add booth13(a, b[12:11], add[12]);
    booth_add booth14(a, b[13:12], add[13]);
    booth_add booth15(a, b[14:13], add[14]);
    booth_add booth16(a, b[15:14], add[15]);
    booth_add booth17(a, b[16:15], add[16]);
    booth_add booth18(a, b[17:16], add[17]);
    booth_add booth19(a, b[18:17], add[18]);
    booth_add booth20(a, b[19:18], add[19]);
    booth_add booth21(a, b[20:19], add[20]);
    booth_add booth22(a, b[21:20], add[21]);
    booth_add booth23(a, b[22:21], add[22]);
    booth_add booth24(a, b[23:22], add[23]);
    booth_add booth25(a, b[24:23], add[24]);
    booth_add booth26(a, b[25:24], add[25]);
    booth_add booth27(a, b[26:15], add[26]);
    booth_add booth28(a, b[27:26], add[27]);
    booth_add booth29(a, b[28:27], add[28]);
    booth_add booth30(a, b[29:28], add[29]);
    booth_add booth31(a, b[30:29], add[30]);
    booth_add booth31(a, b[31:30], add[31]);

    assign add0_ext = {{31{add[0][32]}},add[0]};
    assign add1_ext = {{30{add[1][32]}},add[1]};
    assign add2_ext = {{29{add[2][32]}},add[2]};
    assign add3_ext = {{28{add[3][32]}},add[3]};
    assign add4_ext = {{27{add[4][32]}},add[4]};
    assign add5_ext = {{26{add[5][32]}},add[5]};
    assign add6_ext = {{25{add[6][32]}},add[6]};
    assign add7_ext = {{24{add[7][32]}},add[7]};
    assign add8_ext = {{23{add[8][32]}},add[8]};
    assign add9_ext = {{22{add[9][32]}},add[9]};
    assign add10_ext = {{21{add[10][32]}},add[10]};
    assign add11_ext = {{20{add[11][32]}},add[11]};
    assign add12_ext = {{19{add[12][32]}},add[12]};
    assign add13_ext = {{18{add[13][32]}},add[13]};
    assign add14_ext = {{17{add[14][32]}},add[14]};
    assign add15_ext = {{16{add[15][32]}},add[15]};
    assign add16_ext = {{15{add[16][32]}},add[16]};
    assign add17_ext = {{14{add[17][32]}},add[17]};
    assign add18_ext = {{13{add[18][32]}},add[18]};
    assign add19_ext = {{12{add[19][32]}},add[19]};
    assign add20_ext = {{11{add[20][32]}},add[20]};
    assign add21_ext = {{10{add[21][32]}},add[21]};
    assign add22_ext = {{9{add[22][32]}},add[22]};
    assign add23_ext = {{8{add[23][32]}},add[23]};
    assign add24_ext = {{7{add[24][32]}},add[24]};
    assign add25_ext = {{6{add[25][32]}},add[25]};
    assign add26_ext = {{5{add[26][32]}},add[26]};
    assign add27_ext = {{4{add[27][32]}},add[27]};
    assign add28_ext = {{3{add[28][32]}},add[28]};
    assign add29_ext = {{2{add[29][32]}},add[29]};
    assign add30_ext = {{1{add[30][32]}},add[30]};

    HA1FA6 HA1FA6_u1(clk, add0_ext[7:1], add1_ext, s0);
    HA1FA5 HA1FA5_u1(clk, s0[6:1], add2_ext, s1);
    HA1FA4 HA1FA4_u1(clk, s1[5:1], add3, s2);

    assign p[0] = add0_ext[0];
    assign p[1] = s0[0];
    assign p[2] = s1[0];
    assign p[7:3] = s2;
endmodule

module booth_add(a, b, ab);
    input [3:0] a;
    input [1:0] b;
    wire signed [4:0] a_ext;
    output [4:0] ab;

    assign a_ext = {a[3],a};
    assign ab = (b==2'b01) ? a_ext:
                (b==2'b10) ? -a_ext:
                             5'b0;                                
endmodule

module HA1FA6(clk, a, b, s);
    input clk;
    input [6:0] a;
    input [6:0] b;
    output [6:0] s;

    wire [6:0] carry;
    wire cout;
    HA HA1(clk,a[0],b[0],s[0],carry[0]);
    FA FA1(clk,a[1],b[1],carry[0],s[1],carry[1]);
    FA FA2(clk,a[2],b[2],carry[1],s[2],carry[2]);
    FA FA3(clk,a[3],b[3],carry[2],s[3],carry[3]);
    FA FA4(clk,a[4],b[4],carry[3],s[4],carry[4]);
    FA FA5(clk,a[5],b[5],carry[4],s[5],carry[5]);
    FA FA6(clk,a[6],b[6],carry[5],s[6],carry[6]);

    assign cout = carry[6];
endmodule

module HA1FA5(clk, a, b, s);
    input clk;
    input [5:0] a;
    input [5:0] b;
    output [5:0] s;

    wire [5:0] carry;
    wire cout;
    HA HA1(clk,a[0],b[0],s[0],carry[0]);
    FA FA1(clk,a[1],b[1],carry[0],s[1],carry[1]);
    FA FA2(clk,a[2],b[2],carry[1],s[2],carry[2]);
    FA FA3(clk,a[3],b[3],carry[2],s[3],carry[3]);
    FA FA4(clk,a[4],b[4],carry[3],s[4],carry[4]);
    FA FA5(clk,a[5],b[5],carry[4],s[5],carry[5]);

    assign cout = carry[5];
endmodule

module HA1FA4(clk, a, b, s);
    input clk;
    input [4:0] a;
    input [4:0] b;
    output [4:0] s;

    wire [4:0] carry;
    wire cout;
    HA HA1(clk,a[0],b[0],s[0],carry[0]);
    FA FA1(clk,a[1],b[1],carry[0],s[1],carry[1]);
    FA FA2(clk,a[2],b[2],carry[1],s[2],carry[2]);
    FA FA3(clk,a[3],b[3],carry[2],s[3],carry[3]);
    FA FA4(clk,a[4],b[4],carry[3],s[4],carry[4]);

    assign cout = carry[4];
endmodule