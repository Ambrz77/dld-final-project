module fulladder(Cin, a, b,Cout, out);

output Cout, out;
input Cin, a, b;
wire xor1, and1, and2;
and(and1, Cin, xor1);
and(and2, a, b);
xor(xor1, a, b);
xor(out, Cin, xor1);
or(Cout, and2, and1);


endmodule

module signedAdder(a, b, out, Carryout, OverFlow);
input [5:0] a, b;
output Carryout, OverFlow;
output [5:0] out;
wire [4:0] Couts;

fulladder fadder0(0, a[0], b[0], out[0], Couts[0]);
fulladder fadder1(Couts[0], a[1], b[1], out[1], Couts[1]);
fulladder fadder2(Couts[1], a[2], b[2], out[2], Couts[2]);
fulladder fadder3(Couts[2], a[3], b[3], out[3], Couts[3]);
fulladder fadder4(Couts[3], a[4], b[4], out[4], Couts[4]);
fulladder fadder5(Couts[4], a[5], b[5], out[5], Carryout);
xor(OverFlow, Couts[4], Carryout);
endmodule