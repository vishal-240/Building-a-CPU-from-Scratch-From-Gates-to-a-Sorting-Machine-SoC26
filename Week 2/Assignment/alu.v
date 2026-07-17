// Week 2 — 8-bit ALU
// op: 000=ADD 001=SUB 010=AND 011=OR 100=XOR 101=SHIFTL 110=SHIFTR
// Run: iverilog -o sim ../testbenches/tb_alu.v alu.v && vvp

module alu(
    input  [7:0] a, b,
    input  [2:0] op,
    output reg [7:0] result,
    output           zero,
    output reg       carry,
    output reg       overflow
);

always @(*) begin
    // Default values
    result   = 8'b0;
    carry    = 0;
    overflow = 0;

    case (op)

        // ADD
        3'b000: begin
            {carry, result} = a + b;
            overflow = (~a[7] & ~b[7] & result[7]) |
                       ( a[7] &  b[7] & ~result[7]);
        end

        // SUB using a - b directly
        3'b001: begin
            {carry, result} = a - b;

                        carry = ~carry; 
            
            overflow = (~a[7] & b[7] & result[7]) |
                       ( a[7] & ~b[7] & ~result[7]);
        end

        // AND
        3'b010: result = a & b;

        // OR
        3'b011: result = a | b;

        // XOR
        3'b100: result = a ^ b;

        // SHIFT LEFT
        3'b101: begin
            result = a << 1;
            carry  = a[7];
        end

        // SHIFT RIGHT
        3'b110: begin
            result = a >> 1;
            carry  = a[0];
        end

        default: result = 8'b0;
    endcase
end

// Zero flag
assign zero = (result == 8'b0);

endmodule
