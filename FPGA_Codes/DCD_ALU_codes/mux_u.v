module mux (arith_in,logic_in,sel,out_mux);
	input signed  [7:0] arith_in;
	input signed  [3:0] logic_in;
	input  sel;
	output reg signed [7:0] out_mux;

	always @(*) begin
		if(sel == 0)
			out_mux = arith_in;
		else
			out_mux= {{4{logic_in[3]}}, logic_in};
	end

endmodule