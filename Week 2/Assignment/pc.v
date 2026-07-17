// Week 2 — Program Counter (6-bit)
// Priority: rst > load > inc > hold
// Run: iverilog -o sim ../testbenches/tb_pc.v pc.v && vvp sim

module pc(
    input            clk, rst, inc, load,
    input      [5:0] load_val,
    output reg [5:0] pc_out
);
    always @(posedge clk) begin
        if(rst) pc_out <= 0;
	    else if(load) pc_out <= load_val;
	    else if(inc) pc_out <= pc_out + 1;
        // if rst:  pc_out = 0
        // if load: pc_out = load_val
        // if inc:  pc_out = pc_out + 1
    end
endmodule
