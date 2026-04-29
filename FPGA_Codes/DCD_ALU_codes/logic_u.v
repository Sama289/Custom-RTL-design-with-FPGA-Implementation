module logic_unit (a,b,op_code,out_logic);
	input signed  [3:0] a,b;
	input  wire [2:0] op_code;
	output reg signed [3:0] out_logic;

	always @(*) begin
		case(op_code)
			0: out_logic = ~a;

			1: out_logic = ~b;

			2: out_logic = a & b;

			3: out_logic = a | b;

			4: out_logic = a ^ b;

			5: out_logic = a ~^ b;

			6: out_logic = ~(a & b);

			7: out_logic = ~(a | b);

			default: out_logic = 0;


		endcase
	end
endmodule