module MUX8to1(S, D, F);
	input [2:0] S;
	input [7:0] D;
	output F;
	
	wire [7:0] w;
	
	assign w[7] = S[2] & S[1] & S[0] & D[7];
	assign w[6] = S[2] & S[1] & ~S[0] & D[6];
	assign w[5] = S[2] & ~S[1] & S[0] & D[5];
	assign w[4] = S[2] & ~S[1] & ~S[0] & D[4];
	assign w[3] = ~S[2] & S[1] & S[0] & D[3];
	assign w[2] = ~S[2] & S[1] & ~S[0] & D[2];
	assign w[1] = ~S[2] & ~S[1] & S[0] & D[1];
	assign w[0] = ~S[2] & ~S[1] & ~S[0] & D[0];
	
	assign F = w[7] | w[6] | w[5] | w[4] | w[3] | w[2] | w[1] | w[0];
endmodule
