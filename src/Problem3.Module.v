module Q3(res, select0, select1, A, B);
	input signed[5:0] A, B;
	input select0, select1;
	wire [5:0] result0, result1, result2, result3;
	output [5:0] res;
	
	operator0 opr0(A, B, result0);
	operator1 opr1(A, B, result1);
	operator2 opr2(A, B, result2);
	operator3 opr3(A, B, result3);
	assign res = select1?(select0?result3:result2):(select0?result1:result0);
endmodule

module operator0(input signed[5:0] a, input signed[5:0] b, output signed [5:0] out);
	assign out = (a <<< 2) + (b >>> 1);
endmodule

module operator1 (input signed[5:0] a, input signed[5:0] b, output signed [5:0] out);
	assign out = a + (b + b + b);
endmodule

module operator2 (input signed[5:0] a, input signed[5:0] b, output signed [5:0] out);
	assign out = a - b;
endmodule

module operator3 (input signed[5:0] a, input signed[5:0] b, output reg signed [5:0] out);
	always@(*)
	begin
	out = (a + a) - b;
	if (out < 0)	out = -out;
	end
endmodule
