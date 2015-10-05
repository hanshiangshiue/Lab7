`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:16:16 09/01/2015 
// Design Name: 
// Module Name:    year 
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
module year(
    clk_out,
	 rst_n,
	 increase,
	 year3,
	 year2,
	 year1,
	 year0,
	 over
	 );


input clk_out;
input rst_n;
input increase;
output [3:0] year3;
output [3:0] year2;
output [3:0] year1;
output [3:0] year0;
output over;

reg [3:0] year3;
reg [3:0] year2;
reg [3:0] year1;
reg [3:0] year0;
reg over;
reg [3:0] year2_next;
reg [3:0] year1_next;
reg [3:0] year0_next;


always@(*)
begin
	if({year2,year1,year0}==12'b0010_0000_0000 && increase==1'b1)
	begin
		year2_next=4'd0;
		year1_next=4'd0;
		year0_next=4'd0;
		over=1'b1;
	end
	else if({year2,year1,year0}!=12'b0010_0000_0000 && increase==1'b1)
	begin
		if(year0<4'd9)//2000 -> 2001
		begin
			year2_next=year2;
			year1_next=year1;
			year0_next=year0+4'd1;
			over=1'b0;
		end
		else if(year0==4'd9 && year1<4'd9)//2009 -> 2010
		begin
			year2_next=year2;
			year1_next=year1+4'd1;
			year0_next=4'd0;
			over=1'b0;
		end
		else//year0==4'd9 && year1==4'd9   2099 -> 2100
		begin
			year2_next=year2+4'd1;
			year1_next=4'd0;
			year0_next=4'd0;
			over=1'b0;
		end
	end
	else
	begin
		year2_next=year2;
		year1_next=year1;
		year0_next=year0;
		over=1'b0;
	end
end




always@(posedge clk_out or negedge rst_n)
begin
	if(~rst_n)
	begin
		year3<=4'd2;
		year2<=4'd0;
		year1<=4'd0;
		year0<=4'd0;
	end
	else
	begin
		year3<=4'd2;
		year2<=year2_next;
		year1<=year1_next;
		year0<=year0_next;
	end
end



endmodule
