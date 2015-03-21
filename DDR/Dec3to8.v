module Dec3to8(in, out);

	input [2:0] in;
	output [7:0] out;
	
	wire [7:0] D;
	assign out = D;
	
	assign D[0] = ~(~in[2] & ~in[1] & ~in[0]);
	assign D[1] = ~(~in[2] & ~in[1] & in[0]);
	assign D[2] = ~(~in[2] & in[1] & ~in[0]);
	assign D[3] = ~(~in[2] & in[1] & in[0]);
	assign D[4] = ~(in[2] & ~in[1] & ~in[0]);
	assign D[5] = ~(in[2] & ~in[1] & in[0]);
	assign D[6] = ~(in[2] & in[1] & ~in[0]);
	assign D[7] = ~(in[2] & in[1] & in[0]);
	
endmodule
