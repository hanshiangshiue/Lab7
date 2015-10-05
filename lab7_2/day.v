`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:19:48 09/01/2015 
// Design Name: 
// Module Name:    day 
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
module day(
    clk_out,
	 rst_n,
	 increase,//要不要+1
	 month1,
	 month0,
	 day1,
	 day0,
	 over
	 );


input clk_out;
input rst_n;
input increase;
input [3:0] month1;
input [3:0] month0;
output [3:0] day1;
output [3:0] day0;
output over;



reg [3:0] day1;
reg [3:0] day0;
reg over;
reg [3:0] day0_next;
reg [3:0] day1_next;
reg [3:0] limit1;//記錄這個月能數幾天
reg [3:0] limit0;//記錄這個月能數幾天



always@(*)
begin
	case({month1,month0})
	8'b0000_0001:
	begin
		limit1=4'd3;
		limit0=4'd1;
	end
	8'b0000_0010:
	begin
		limit1=4'd2;
		limit0=4'd8;
	end
	8'b0000_0011:
	begin
		limit1=4'd3;
		limit0=4'd1;
	end
	8'b0000_0100:
	begin
		limit1=4'd3;
		limit0=4'd0;
	end
	8'b0000_0101:
	begin
		limit1=4'd3;
		limit0=4'd1;
	end
	8'b0000_0110:
	begin
		limit1=4'd3;
		limit0=4'd0;
	end
	8'b0000_0111:
	begin
		limit1=4'd3;
		limit0=4'd1;
	end
	8'b0000_1000:
	begin
		limit1=4'd3;
		limit0=4'd1;
	end
	8'b0000_1001:
	begin
		limit1=4'd3;
		limit0=4'd0;
	end
	8'b0001_0000:
	begin
		limit1=4'd3;
		limit0=4'd1;
	end
	8'b0001_0001:
	begin
		limit1=4'd3;
		limit0=4'd0;
	end
	8'b0001_0010:
	begin
		limit1=4'd3;
		limit0=4'd1;
	end
	default:
	begin
		limit1=4'd0;
		limit0=4'd0;
	end
	endcase
end



always@(*)
begin
	if({day1,day0}=={limit1,limit0} && increase==1'b1)
	begin
		day1_next=4'd0;
		day0_next=4'd1;
		over=1'b1;
	end
	else if({day1,day0}!={limit1,limit0} && increase==1'b1)
	begin
		if(day0<4'd9)
		begin
			day0_next=day0+4'd1;
			day1_next=day1;
			over=1'b0;
		end
		else
		begin
			day0_next=4'd0;
			day1_next=day1+4'd1;
			over=1'b0;
		end
	end
	else
	begin
		day0_next=day0;
		day1_next=day1;
		over=1'b0;
	end
end




always@(posedge clk_out or negedge rst_n)
begin
	if(~rst_n)
	begin
		day0<=4'd1;
		day1<=4'd0;
	end
	else
	begin
		day0<=day0_next;
		day1<=day1_next;
	end
end


endmodule
