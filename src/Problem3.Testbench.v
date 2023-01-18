module testbench();
	
reg[5:0] A, B;
reg select0, select1;
wire[5:0] res;
Q3 alu(res,select0, select1, A, B);
	
initial
begin

select1=0; select0=0; 
A = 6'b000010;	B = 6'b000001;
#100;

select1=0; select0=1; 
A = 6'b000010;	B = 6'b000001;

#100;

select1=1; select0=0; 
A = 6'b000010;	B = 6'b000001;

#100;

select1=1; select0=1;
A = 6'b000010;	B = 6'b000001;

#100;

end
	
endmodule
