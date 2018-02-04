module rtc (
	input sclk,
	input poll_freq,

	output reg ce,
	output reg[4:0] digit,

	inout data_io
);

wire data_in_w, data_out_w;
reg data_in = 1'b0;
reg data_out = 1'b0;
reg input_en = 1'b0;

assign iobuf_out_wire = data_in;
assign iobuf_in_wire = data_out;

IOBUF iobuf (
	.O(iobuf_out_wire),
	.IO(data_io),
	.I(iobuf_in_wire),
	.T(input_en)
);

always @ (posedge sclk) begin
	ce <= 1'b0;
	digit <= 5'd0;
end

endmodule
