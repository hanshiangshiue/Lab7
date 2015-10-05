`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:15:09 08/31/2015 
// Design Name: 
// Module Name:    hour_12 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module hour_12(
    clk_out,
	 rst_n,
	 hr1,
	 hr0,
	 a1,
	 a0,
	 hrtw1,
	 hrtw0
	 );

input clk_out;
input rst_n;
input [3:0] hr1;
input [3:0] hr0;
output [3:0] a1;//A,P
output [3:0] a0;//M
output [3:0] hrtw1;//12小時制
output [3:0] hrtw0;//12小時制

reg [3:0] a1;
reg [3:0] a0;
reg [3:0] hrtw1;
reg [3:0] hrtw0;
reg [3:0] a1_next;;
reg [3:0] a0_next;
reg [3:0] hrtw1_next;
reg [3:0] hrtw0_next;




always@(*)
begin
	case({hr1,hr0})
	8'b0000_0000://00:00
	begin
		a1_next=4'd12;//P
		a0_next=4'd11;//M
		hrtw1_next=4'd1;//1
		hrtw0_next=4'd2;//2
	end
	8'b0000_0001://01:00
	begin
		a1_next=4'd10;//A
		a0_next=4'd11;//M
		hrtw1_next=4'd0;//0
		hrtw0_next=4'd1;//1
	end
	8'b0000_0010:
	begin
		a1_next=4'd10;
		a0_next=4'd11;
		hrtw1_next=4'd0;
		hrtw0_next=4'd2;
	end
	8'b0000_0011:
	begin
		a1_next=4'd10;
		a0_next=4'd11;
		hrtw1_next=4'd0;
		hrtw0_next=4'd3;
	end
	8'b0000_0100:
	begin
		a1_next=4'd10;
		a0_next=4'd11;
		hrtw1_next=4'd0;
		hrtw0_next=4'd4;
	end
	8'b0000_0101:
	begin
		a1_next=4'd10;
		a0_next=4'd11;
		hrtw1_next=4'd0;
		hrtw0_next=4'd5;
	end
	8'b0000_0110:
	begin
		a1_next=4'd10;
		a0_next=4'd11;
		hrtw1_next=4'd0;
		hrtw0_next=4'd6;
	end
	8'b0000_0111:
	begin
		a1_next=4'd10;
		a0_next=4'd11;
		hrtw1_next=4'd0;
		hrtw0_next=4'd7;
	end
	8'b0000_1000:
	begin
		a1_next=4'd10;
		a0_next=4'd11;
		hrtw1_next=4'd0;
		hrtw0_next=4'd8;
	end
	8'b0000_1001:
	begin
		a1_next=4'd10;
		a0_next=4'd11;
		hrtw1_next=4'd0;
		hrtw0_next=4'd9;
	end
	8'b0001_0000:
	begin
		a1_next=4'd10;
		a0_next=4'd11;
		hrtw1_next=4'd1;
		hrtw0_next=4'd0;
	end
	8'b0001_0001:
	begin
		a1_next=4'd10;
		a0_next=4'd11;
		hrtw1_next=4'd1;
		hrtw0_next=4'd1;
	end
	8'b0001_0010://12:00
	begin
		a1_next=4'd10;//A
		a0_next=4'd11;//M
		hrtw1_next=4'd1;//1
		hrtw0_next=4'd2;//2
	end
	8'b0001_0011://13:00
	begin
		a1_next=4'd12;//P
		a0_next=4'd11;//M
		hrtw1_next=4'd0;//0
		hrtw0_next=4'd1;//1
	end
	8'b0001_0100:
	begin
		a1_next=4'd12;
		a0_next=4'd11;
		hrtw1_next=4'd0;
		hrtw0_next=4'd2;
	end
	8'b0001_0101:
	begin
		a1_next=4'd12;
		a0_next=4'd11;
		hrtw1_next=4'd0;
		hrtw0_next=4'd3;
	end
	8'b0001_0110:
	begin
		a1_next=4'd12;
		a0_next=4'd11;
		hrtw1_next=4'd0;
		hrtw0_next=4'd4;
	end
	8'b0001_0111:
	begin
		a1_next=4'd12;
		a0_next=4'd11;
		hrtw1_next=4'd0;
		hrtw0_next=4'd5;
	end
	8'b0001_1000:
	begin
		a1_next=4'd12;
		a0_next=4'd11;
		hrtw1_next=4'd0;
		hrtw0_next=4'd6;
	end
	8'b0001_1001:
	begin
		a1_next=4'd12;
		a0_next=4'd11;
		hrtw1_next=4'd0;
		hrtw0_next=4'd7;
	end
	8'b0010_0000:
	begin
		a1_next=4'd12;
		a0_next=4'd11;
		hrtw1_next=4'd0;
		hrtw0_next=4'd8;
	end
	8'b0010_0001:
	begin
		a1_next=4'd12;
		a0_next=4'd11;
		hrtw1_next=4'd0;
		hrtw0_next=4'd9;
	end
	8'b0010_0010:
	begin
		a1_next=4'd12;
		a0_next=4'd11;
		hrtw1_next=4'd1;
		hrtw0_next=4'd0;
	end
	8'b0010_0011:
	begin
		a1_next=4'd12;
		a0_next=4'd11;
		hrtw1_next=4'd1;
		hrtw0_next=4'd1;
	end
	default:
	begin
		a1_next=4'd0;
		a0_next=4'd0;
		hrtw1_next=4'd0;
		hrtw0_next=4'd0;
	end
	endcase
end



always@(posedge clk_out or negedge rst_n)
begin
	if(~rst_n)
	begin
		a1<=4'd0;
		a0<=4'd0;
		hrtw1<=4'd0;
		hrtw0<=4'd0;
	end
	else
	begin
		a1<=a1_next;
		a0<=a0_next;
		hrtw1<=hrtw1_next;
		hrtw0<=hrtw0_next;
	end
end




endmodule
