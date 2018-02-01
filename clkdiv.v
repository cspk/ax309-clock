module clkdiv(
	input clk,
	input[4:0] divisor, // logarithm base 2
	
	output reg divclk
);

reg[31:0] cnt = 31'd0;

always @ (posedge clk) begin
	cnt <= cnt + 1;
end

always @ (posedge cnt[divisor]) begin
	divclk <= ~divclk;
end

endmodule
