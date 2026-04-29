module logic_unit (a,b,op_code,out_logic);
	input signed  [3:0] a,b;
	input  wire [2:0] op_code;
	output reg [3:0] out_logic;

	always @(*) begin
		case(op_code)
			0: out_logic = ~a;//Complement a 

			1: out_logic = ~b;//Complement b 

			2: out_logic = a & b;//AND 

			3: out_logic = a | b;//OR 

			4: out_logic = a ^ b;//XOR 

			5: out_logic = a ~^ b;//XNOR 

			6: out_logic = ~(a & b);//NAND 

			7: out_logic = ~(a | b);//NOR

			default: out_logic = 0;//default value of the output 


		endcase
	end

endmodule