module count20bit(Clock, Reset, out);

	input Clock, Reset;
	output [19:0] out;
	wire [19:0] carryOut;
	wire [19:0] sum;
	wire [19:0] Q;
	
	fullAdd a1(.a(Q[0]), .b(1), .cin(0), .carO(carryOut[0]), .sum1Bit(sum[0]));
	fullAdd a2(.a(Q[1]), .b(0), .cin(carryOut[0]), .carO(carryOut[1]), .sum1Bit(sum[1]));
	fullAdd a3(.a(Q[2]), .b(0), .cin(carryOut[1]), .carO(carryOut[2]), .sum1Bit(sum[2]));
	fullAdd a4(.a(Q[3]), .b(0), .cin(carryOut[2]), .carO(carryOut[3]), .sum1Bit(sum[3]));
	fullAdd a5(.a(Q[4]), .b(0), .cin(carryOut[3]), .carO(carryOut[4]), .sum1Bit(sum[4]));
	fullAdd a6(.a(Q[5]), .b(0), .cin(carryOut[4]), .carO(carryOut[5]), .sum1Bit(sum[5]));
	fullAdd a7(.a(Q[6]), .b(0), .cin(carryOut[5]), .carO(carryOut[6]), .sum1Bit(sum[6]));
	fullAdd a8(.a(Q[7]), .b(0), .cin(carryOut[6]), .carO(carryOut[7]), .sum1Bit(sum[7]));
	fullAdd a9(.a(Q[8]), .b(0), .cin(carryOut[7]), .carO(carryOut[8]), .sum1Bit(sum[8]));
	fullAdd a10(.a(Q[9]), .b(0), .cin(carryOut[8]), .carO(carryOut[9]), .sum1Bit(sum[9]));
	fullAdd a11(.a(Q[10]), .b(0), .cin(carryOut[9]), .carO(carryOut[10]), .sum1Bit(sum[10]));
	fullAdd a12(.a(Q[11]), .b(0), .cin(carryOut[10]), .carO(carryOut[11]), .sum1Bit(sum[11]));
	fullAdd a13(.a(Q[12]), .b(0), .cin(carryOut[11]), .carO(carryOut[12]), .sum1Bit(sum[12]));
	fullAdd a14(.a(Q[13]), .b(0), .cin(carryOut[12]), .carO(carryOut[13]), .sum1Bit(sum[13]));
	fullAdd a15(.a(Q[14]), .b(0), .cin(carryOut[13]), .carO(carryOut[14]), .sum1Bit(sum[14]));
	fullAdd a16(.a(Q[15]), .b(0), .cin(carryOut[14]), .carO(carryOut[15]), .sum1Bit(sum[15]));
	fullAdd a17(.a(Q[16]), .b(0), .cin(carryOut[15]), .carO(carryOut[16]), .sum1Bit(sum[16]));
	fullAdd a18(.a(Q[17]), .b(0), .cin(carryOut[16]), .carO(carryOut[17]), .sum1Bit(sum[17]));
	fullAdd a19(.a(Q[18]), .b(0), .cin(carryOut[17]), .carO(carryOut[18]), .sum1Bit(sum[18]));
	fullAdd a20(.a(Q[19]), .b(0), .cin(carryOut[18]), .carO(carryOut[19]), .sum1Bit(sum[19]));

	
	D_FF d1 (.q(Q[0]), .d(sum[0]), .reset(Reset), .clk(Clock));	
	D_FF d2 (.q(Q[1]), .d(sum[1]), .reset(Reset), .clk(Clock));	
	D_FF d3 (.q(Q[2]), .d(sum[2]), .reset(Reset), .clk(Clock));
	D_FF d4 (.q(Q[3]), .d(sum[3]), .reset(Reset), .clk(Clock));	
	D_FF d5 (.q(Q[4]), .d(sum[4]), .reset(Reset), .clk(Clock));	
	D_FF d6 (.q(Q[5]), .d(sum[5]), .reset(Reset), .clk(Clock));
	D_FF d7 (.q(Q[6]), .d(sum[6]), .reset(Reset), .clk(Clock));	
	D_FF d8 (.q(Q[7]), .d(sum[7]), .reset(Reset), .clk(Clock));	
	D_FF d9 (.q(Q[8]), .d(sum[8]), .reset(Reset), .clk(Clock));
	D_FF d10 (.q(Q[9]), .d(sum[9]), .reset(Reset), .clk(Clock));	
	D_FF d11 (.q(Q[10]), .d(sum[10]), .reset(Reset), .clk(Clock));	
	D_FF d12 (.q(Q[11]), .d(sum[11]), .reset(Reset), .clk(Clock));
	D_FF d13 (.q(Q[12]), .d(sum[12]), .reset(Reset), .clk(Clock));	
	D_FF d14 (.q(Q[13]), .d(sum[13]), .reset(Reset), .clk(Clock));	
	D_FF d15 (.q(Q[14]), .d(sum[14]), .reset(Reset), .clk(Clock));
	D_FF d16 (.q(Q[15]), .d(sum[15]), .reset(Reset), .clk(Clock));	
	D_FF d17 (.q(Q[16]), .d(sum[16]), .reset(Reset), .clk(Clock));
	D_FF d18 (.q(Q[17]), .d(sum[17]), .reset(Reset), .clk(Clock));	
	D_FF d19 (.q(Q[18]), .d(sum[18]), .reset(Reset), .clk(Clock));	
	D_FF d20 (.q(Q[19]), .d(sum[19]), .reset(Reset), .clk(Clock));	

	assign out = sum[19:0];

endmodule
