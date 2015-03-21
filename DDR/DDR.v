module DDR(CLOCK_50, KEY, SW, HEX0, HEX1, HEX2, HEX3, GPIO_0);
	input CLOCK_50;
	inout [35:0] GPIO_0;
	
	wire [31:0] clk;
	parameter whichClock = 4;
	
	// for 1Hz slow
	wire isNum1;
	
	//parameter whichClock1 = 21;
	clock_divider cdiv (CLOCK_50, clk);
	wire [19:0] num20bit;
	
	// To generate random numbers for CPU controls
	wire [8:0] L9out;
	//wire[8:0] SW;
	wire [9:0] nu;
	//module LRFR9(Clock, Reset, O);
	LFSR9 LB9(.Clock(clk[whichClock]), .Reset(res), .O(L9out));
	Adder10 RNG(.A(L9out[8:0]), .B(SW[8:0]), .S(nu[9:0]));
	
	// KEY for user input. SW[8:0] for probability of CPU's input. SW[9] reset
	input [3:0] KEY;
	input [9:0] SW;
	
	
	// Score displays
	output [0:6] HEX0;
	output [0:6] HEX1;
	output [0:6] HEX2;
	output [0:6] HEX3;
	
	// 1's place
	wire incOutPosO;
	wire incOutNegO;
	
	// 10's place
	wire incOutPosT;
	wire incOutNegT;
	
	// 100's place
	wire incOutPosH;
	wire incOutNegH;
	
	// 1000's place
	wire incOutPosX;
	wire incOutNegX;

	
	// control inputs
	wire add2;
	wire add1;
	wire sub2;
	
	// To see if reach end
	wire c2end;
	wire c3end;
	wire c5end;
	wire c6end;

	
	// to see if user pressed a key at rights times or not, -2 points if not and get to end
	wire c2pressedO;
	wire c3pressedO;
	wire c5pressedO;
	wire c6pressedO;
	
	wire c2pressedG;
	wire c3pressedG;
	wire c5pressedG;
	wire c6pressedG;
	
	wire c2noPressSub2;
	wire c3noPressSub2;
	wire c5noPressSub2;
	wire c6noPressSub2;
	
	// for Key press detection
	wire press3;
	wire press2;
	wire press1;
	wire press0;
	
	// 3-Bit counter generate numbers 0-7
	wire[2:0] num;
	
	wire [7:0] col2G;
	wire [7:0] col3G;
	wire [7:0] col5G;
	wire [7:0] col6G;
	
	wire [7:0] col2O;
	wire [7:0] col3O;
	wire [7:0] col5O;
	wire [7:0] col6O;
	
	
	row1LightsG R1C2g(.Reset(SW[9]), .is10(isNum1), .num(L9out[0]), .lightOn(col2G[0]));
	//row1LightsG R1C3g(.Clock(clk[whichClock]), .Reset(SW[9]), .num(L9out[3]), .lightOn(col3G[0]));
	//row1LightsG R1C5g(.Clock(clk[whichClock]), .Reset(SW[9]), .num(L9out[5]), .lightOn(col5G[0]));
	//row1LightsG R1C6g(.Clock(clk[whichClock]), .Reset(SW[9]), .num(L9out[8]), .lightOn(col6G[0]));
	//
	
	
	rowRegLightsG rR2C2g(.Reset(SW[9]), .is10(isNum1), .preLight(col2G[0]), .lightOn(col2G[1]));
	//rowRegLightsG rR2C3g(.Clock(clk[whichClock]), .Reset(SW[9]), .preLight(col3G[0]), .lightOn(col3G[1]));
	//rowRegLightsG rR2C5g(.Clock(clk[whichClock]), .Reset(SW[9]), .preLight(col5G[0]), .lightOn(col5G[1]));
	//rowRegLightsG rR2C6g(.Clock(clk[whichClock]), .Reset(SW[9]), .preLight(col6G[0]), .lightOn(col6G[1]));
	//
	
	
	
	rowRegLightsG rR3C2g(.Reset(SW[9]), .is10(isNum1), .preLight(col2G[1]), .lightOn(col2G[2]));	
	//rowRegLightsG rR3C3g(.Clock(clk[whichClock]), .Reset(SW[9]), .preLight(col3G[1]), .lightOn(col3G[2]));	
	//rowRegLightsG rR3C5g(.Clock(clk[whichClock]), .Reset(SW[9]), .preLight(col5G[1]), .lightOn(col5G[2]));	
	//rowRegLightsG rR3C6g(.Clock(clk[whichClock]), .Reset(SW[9]), .preLight(col6G[1]), .lightOn(col6G[2]));	
	//
	
	
	rowRegLightsG rR4C2g(.Reset(SW[9]), .is10(isNum1), .preLight(col2G[2]), .lightOn(col2G[3]));
	//rowRegLightsG rR4C3g(.Clock(clk[whichClock]), .Reset(SW[9]), .preLight(col3G[2]), .lightOn(col3G[3]));
	//rowRegLightsG rR4C5g(.Clock(clk[whichClock]), .Reset(SW[9]), .preLight(col5G[2]), .lightOn(col5G[3]));
	//rowRegLightsG rR4C6g(.Clock(clk[whichClock]), .Reset(SW[9]), .preLight(col6G[2]), .lightOn(col6G[3]));
	//
	
	rowRegLightsG rR5C2g(.Reset(SW[9]), .is10(isNum1), .preLight(col2G[3]), .lightOn(col2G[4]));
	
	rowRegLightsG rR6C2g(.Reset(SW[9]), .is10(isNum1), .preLight(col2G[4]), .lightOn(col2G[5]));
	
	
	rowLightsO R7C2o(.Reset(SW[9]), .is10(isNum1), .key(press3), .preLight(col2G[5]), .pressed(c2pressedO), .lightOn(col2O[6]));
	//rowLightsO R5C3o(.Clock(clk[whichClock]), .Reset(SW[9]), .key(press2), .preLight(col3G[3]), .pressed(c2pressedO), .lightOn(col3O[4]));
	//rowLightsO R5C5o(.Clock(clk[whichClock]), .Reset(SW[9]), .key(press1), .preLight(col5G[3]), .pressed(c2pressedO), .lightOn(col5O[4]));
	//rowLightsO R5C6o(.Clock(clk[whichClock]), .Reset(SW[9]), .key(press0), .preLight(col6G[3]), .pressed(c2pressedO), .lightOn(col6O[4]));
	//
	
	
	rowLightsGLast r8C2g(.Reset(SW[9]), .is10(isNum1), .key(press3), .preLight(col2O[6]), .pressed(c2pressedG), .lightOn(col2G[7]));
	//rowLightsGLast r6C3g(.Clock(clk[whichClock]), .Reset(SW[9]), .key(press2), .preLight(col3O[4]), .pressed(c2pressedG), .lightOn(col3G[5]));
	//rowLightsGLast r6C5g(.Clock(clk[whichClock]), .Reset(SW[9]), .key(press1), .preLight(col5O[4]), .pressed(c2pressedG), .lightOn(col5G[5]));
	//rowLightsGLast r6C6g(.Clock(clk[whichClock]), .Reset(SW[9]), .key(press0), .preLight(col6O[4]), .pressed(c2pressedG), .lightOn(col6G[5]));
	//	
	
	//arenaEnd c2aE(.Clock(clk[whichClock]), is10(isNum10), .Reset(SW[9]), .preLight(col2G[5]), .reachEnd(c2end));
	//arenaEnd c3aE(.Clock(clk[whichClock]), .Reset(SW[9]), .preLight(col3G[5]), .reachEnd(c3end));
	//arenaEnd c5aE(.Clock(clk[whichClock]), .Reset(SW[9]), .preLight(col5G[5]), .reachEnd(c5end));
	//arenaEnd c6aE(.Clock(clk[whichClock]), .Reset(SW[9]), .preLight(col6G[5]), .reachEnd(c6end));

	
	//arenaEndPoints(Clock, Reset, reach, pressedO, pressedG, sub2);
	//arenaEndPoints c2aEP(.reach(c2end), .pressedO(c2pressedO), .pressedG(c2pressedG), .sub2(c2noPressSub2));
	//arenaEndPoints c3aEP(.reach(c3end), .pressedO(c3pressedO), .pressedG(c3pressedG), .sub2(c3noPressSub2));
	//arenaEndPoints c5aEP(.reach(c5end), .pressedO(c5pressedO), .pressedG(c5pressedG), .sub2(c5noPressSub2));
	//arenaEndPoints c6aEP(.reach(c6end), .pressedO(c6pressedO), .pressedG(c6pressedG), .sub2(c6noPressSub2));
	
	//counter20IS10 isIt10(.Clock(clk[whichClock]), .Reset(SW[9]), .is10(isNum10));
	count20bit c20B(.Clock(clk[whichClock]), .Reset(SW[9]), .out(num20bit));
	is1 yes1(.Clock(clk[whichClock]), .Reset(SW[9]), .num20b(num20bit), .yes1(isNum1));
	
	Bit3Count num3(.Clock(clk[whichClock]), .Reset(SW[9]), .num(num));
	
	// D-21 to F-22
	
	Dec3to8 row0(.in(num), .out(GPIO_0[25:18]));
	

	
	// B-16 to A-20
	// have  one per light per column
	//	MUX7to1 column2G(.S(num), .D0(col2G[0]), .D1(col2G[1]), .D2(col2G[2]), .D3(col2G[3]), .D4(0), .D5(col2G[5]), .D6(col2G[6]), .F(GPIO_0[7]));
	//MUX7to1 column2O(.S(num), .D0(0), .D1(0), .D2(0), .D3(0), .D4(col2O[4]), .D5(0), .D6(0), .F(GPIO_0[8]));
	
	MUX8to1 column2G(.S(num), .D(col2G[7:0]), .F(GPIO_0[7]));
	MUX8to1 column2O(.S(num), .D(col2O[7:0]), .F(GPIO_0[8]));
	
	//MUX7to1 column3G(.S(num), .D(col3G[6:0]), .F(GPIO_0[9]));
	//MUX7to1 column3O(.S(num), .D(col3O[6:0]), .F(GPIO_0[10]));
	
	//MUX7to1 column5G(.S(num), .D(col5G[6:0]), .F(GPIO_0[11]));
	//MUX7to1 column5O(.S(num), .D(col5O[6:0]), .F(GPIO_0[12]));
	
	//MUX7to1 column6G(.S(num), .D(col6G[6:0]), .F(GPIO_0[13]));
	//MUX7to1 column6O(.S(num), .D(col6O[6:0]), .F(GPIO_0[14]));
	
	//userIn uIAdd2 (.Clock(CLOCK_50), .Reset(SW[9]), .In(KEY[3]), .Press(add2));
	//userIn uIAdd1 (.Clock(CLOCK_50), .Reset(SW[9]), .In(KEY[2]), .Press(add1));
	//userIn uISub2 (.Clock(CLOCK_50), .Reset(SW[9]), .In(KEY[1]), .Press(sub2));
	
	userIn sw3 (.Clock(clk[whichClock]), .Reset(SW[9]), .In(KEY[3]), .Press(press3));
	userIn sw2 (.Clock(clk[whichClock]), .Reset(SW[9]), .In(KEY[2]), .Press(press2));
	userIn sw1 (.Clock(clk[whichClock]), .Reset(SW[9]), .In(KEY[1]), .Press(press1));
	userIn sw0 (.Clock(clk[whichClock]), .Reset(SW[9]), .In(KEY[0]), .Press(press0));
	
	//scoreKeep(Clock, Reset, OlightOn, lastGlightOn, key, add1, add2, sub2);
	scoreKeep s2K(.Clock(clk[whichClock]), .Reset(SW[9]), .OlightOn(col2O[6]), .lastGlightOn(col2G[7]), .key(press3), .add1(add1), .add2(add2), .sub2(sub2));
	//scoreKeep s3K(.Clock(clk[whichClock]), .Reset(SW[9]), .OlightOn(col3O[4]), .lastGlightOn(col3O[5]), .key(press2), .add1(add1), .add2(add2), .sub2(sub2));
	//scoreKeep s5K(.Clock(clk[whichClock]), .Reset(SW[9]), .OlightOn(col5O[4]), .lastGlightOn(col5O[5]), .key(press1), .add1(add1), .add2(add2), .sub2(sub2));
	//scoreKeep s6K(.Clock(clk[whichClock]), .Reset(SW[9]), .OlightOn(col6O[4]), .lastGlightOn(col6O[5]), .key(press0), .add1(add1), .add2(add2), .sub2(sub2));
		
	scoreCountOnes s1(.Clock(clk[whichClock]), .Reset(SW[9]), .otherLeds(HEX1), .plus2(add2), .plus1(add1), .minus2(sub2), .incrementOutPos(incOutPosO), .incrementOutNeg(incOutNegO), .leds(HEX0));
	scoreCount s10(.Clock(clk[whichClock]), .Reset(SW[9]), .incrementInPos(incOutPosO), .incrementInNeg(incOutNegO), .otherLeds(HEX2), .incrementOutPos(incOutPosT), .incrementOutNeg(incOutNegT), .leds(HEX1));
	scoreCount s100(.Clock(clk[whichClock]), .Reset(SW[9]), .incrementInPos(incOutPosT), .incrementInNeg(incOutNegT), .otherLeds(HEX3), .incrementOutPos(incOutPosH), .incrementOutNeg(incOutNegH), .leds(HEX2));
	scoreCount s1000(.Clock(clk[whichClock]), .Reset(SW[9]), .incrementInPos(incOutPosH), .incrementInNeg(incOutNegH), .otherLeds(otherLeds), .incrementOutPos(incOutPosX), .incrementOutNeg(incOutNegX), .leds(HEX3));
	
endmodule
