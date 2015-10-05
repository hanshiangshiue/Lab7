`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:37:28 09/01/2015 
// Design Name: 
// Module Name:    month 
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
module month(
    clk_out,
	 rst_n,
	 increase,
	 month1,
	 month0,
	 over
	 );



input clk_out;
input rst_n;
input increase;
output [3:0] month1;
output [3:0] month0;
output over;


reg [3:0] month1;
reg [3:0] month0;
reg over;
reg [3:0] month1_next;
reg [3:0] month0_next;




always@(*)
begin
	if({month1,month0}==8'b0001_0010 && increase==1'b1)
	begin
		month1_next=4'd0;
		month0_next=4'd1;
		over=1'b1;
	end
	else if({month1,month0}!=8'b0001_0010 && increase==1'b1)
	begin
		if(month0<4'd9)
		begin
			month1_next=month1;
			month0_next=month0+4'd1;
			over=1'b0;
		end
		else
		begin
			month1_next=month1+4'd1;
			month0_next=4'd0;
			over=1'b0;
		end
	end
	else
	begin
		month1_next=month1;
		month0_next=month0;
		over=1'b0;
	end
end




always@(posedge clk_out or negedge rst_n)
begin
	if(~rst_n)
	begin
		month1<=4'd0;
		month0<=4'd1;
	end
	else
	begin
		month1<=month1_next;
		month0<=month0_next;
	end
end


endmodule
