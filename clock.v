module clock(
	input wire clk,
	input wire nrst,

	output reg[7:0] digit_segs,
	output reg[5:0] position
);

always @ (posedge clk or negedge nrst) begin
	if (!nrst) begin
		digit_segs <= 8'd0;
		position <= 8'd0;
	end
end

endmodule
