module add_4_v(
    input [3:0] a,
    input [3:0] b,
    output [3:0] sum,
    output carry
    );
	wire cin[3:0];
	
	assign cin[0] = 1'b0;

	assign s = a[0] ^ b[0] ^ cin[0];
	assign cin[1] = (a[0] & b[0])  |  (a[0] & cin[0])  |  (b[0] & cin[0]);

    assign s = a[1] ^ b[1] ^ cin[1];
	assign cin[2] = (a[1] & b[1])  |  (a[1] & cin)[1]  |  (b[1] & cin[1]);

	assign s = a[2] ^ b[2] ^ cin[2];
	assign cin[3] = (a[2] & b[2])  |  (a[2] & cin[2])  |  (b[2] & cin[2]);
	
	assign s = a[3] ^ b[3] ^ cin[3];
	assign carry = (a[3] & b[3])  |  (a[3] & cin[3])  |  (b[3] & cin[3]);

endmodule
