
// Week 2 — Parameterized MUX
// ===========================
// Parameterized modules let you reuse the same code for 1-bit,
// 8-bit, or any-bit-wide signals — important in a CPU datapath.
//
// Run: iverilog -o sim ../testbenches/tb_mux.v mux.v && vvp sim

// 2:1 MUX — WIDTH bits wide
module mux2 #(parameter WIDTH = 8) (
    input  [WIDTH-1:0] a, b,
    input              sel,
    output [WIDTH-1:0] y
);
    assign y = sel ? b : a;
    
endmodule

// 4:1 MUX — WIDTH bits wide
module mux4 #(parameter WIDTH = 8) (
    input  [WIDTH-1:0] d0, d1, d2, d3,
    input  [1:0]       sel,
    output reg [WIDTH-1:0] y
);
    always @(*) begin
	case(sel) 
	2'b00 : y = d0;
	2'b01 : y = d1;
	2'b10 : y = d2;
	2'b11 : y = d3;
	default: y = 0;
	endcase
end 

endmodule
