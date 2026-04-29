module mux (arith_in,logic_in,sel,out_mux);
	input signed  [7:0] arith_in;
	input  [3:0] logic_in;
	input  sel;
	output reg signed [7:0] out_mux;

	always @(*) begin
		if(sel == 0)
			out_mux = arith_in;
			//if the MSB of sel==0 of then the output is from arithmetic unit
		else
			out_mux= {{4{0}}, logic_in};
			/* if the MSB of sel==1 of then the output is from logic unit
			and extend with 4 bits of zeros */
	end
	
endmodule