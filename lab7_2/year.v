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
	 year1,
	 year0,
	 over
	 );


input clk_out;
input rst_n;
input increase;
output [3:0] year1;
output [3:0] year0;
output over;



reg [3:0] year1;
reg [3:0] year0;
reg over;
reg [3:0] year1_next;
reg [3:0] year0_next;


always@(*)
begin
	if({year1,year0}==8'b1001_1001 && increase==1'b1)
	begin
		year1_next=4'd0;
		year0_next=4'd0;
		over=1'b1;
	end
	else if({year1,year0}!=8'b1001_1001 && increase==1'b1)
	begin
		if(year0<4'd9)
		begin
			year1_next=year1;
			year0_next=year0+4'd1;
			over=1'b0;
		end
		else
		begin
			year1_next=year1+4'd1;
			year0_next=4'd0;
			over=1'b0;
		end
	end
	else
	begin
			year1_next=year1;
			year0_next=year0;
			over=1'b0;
	end
end




always@(posedge clk_out or negedge rst_n)
begin
	if(~rst_n)
	begin
		year1<=4'd0;
		year0<=4'd0;
	end
	else
	begin
		year1<=year1_next;
		year0<=year0_next;
	end
end



endmodule
