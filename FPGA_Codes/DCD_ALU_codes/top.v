module ALU ( a, b, sel , y );
	input signed [3:0] a, b;
	input  [3:0] sel;
	output signed [7:0] y;

	wire signed [7:0] arith_out;
	wire signed [3:0] logic_out;

	logic_unit L_unit (a,b,sel[2:0] ,logic_out);

	arith_unit A_unit (a,b,sel[2:0],arith_out);

	mux M_mux (arith_out,logic_out,sel[3],y);

endmodule