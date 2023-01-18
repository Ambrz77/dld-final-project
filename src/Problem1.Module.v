module inverter(in, out);
output out;
input in;
supply0 gnd;
supply1 pwr;
pmos(out, pwr, in);
nmos(out, gnd, in);
endmodule

module func(A,B,C,D,out);
output out;
input A,B,C,D;
wire [1:6] pSim;
wire [1:3] nSim;
supply0 gnd;
supply1 pwr;
wire Abar, Bbar, Cbar, Dbar;

//For Debug

inverter inv1(A, Abar);
inverter inv2(B, Bbar);
inverter inv3(C, Cbar);
inverter inv4(D, Dbar);

//PMOS

pmos(pSim[1], pwr, Abar);
pmos(out, pSim[1], Dbar);

pmos(pSim[2], pwr, A);
pmos(pSim[3], pSim[2], Bbar);
pmos(out, pSim[3], Cbar);

pmos(pSim[4], pwr, Bbar);
pmos(out, pSim[4], D);

pmos(pSim[5], pwr, A);
pmos(pSim[6], pSim[5], C);
pmos(out, pSim[6], D);

//NMOS

nmos(out,nSim[1],Abar);
nmos(out,nSim[1],Dbar);

nmos(nSim[1], nSim[2], A);
nmos(nSim[1], nSim[2], Bbar);
nmos(nSim[1], nSim[2], Cbar);

nmos(nSim[2], nSim[3], Bbar);
nmos(nSim[2], nSim[3], D);

nmos(nSim[3],gnd, A);
nmos(nSim[3],gnd, C);
nmos(nSim[3],gnd, D);
endmodule