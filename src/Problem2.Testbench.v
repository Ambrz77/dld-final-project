module testbench_signedAdder();
reg [5:0] a, b;
wire Carryout, OverFlow;
wire [5:0] res;
signedAdder sadder(.a(a), .b(b), .Carryout(Cout), .out(res), .OverFlow(OverFlow));

initial
begin

a = 6'b011111;
b = 6'b011111;
#100;

a = 6'b000001;
b = 6'b000001;
#100;

a = 6'b111111;
b = 6'b111111;
#100;
a = 6'b100001;
b = 6'b100001;
#100;

$finish;
end
endmodule