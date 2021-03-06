`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:41:05 08/31/2015 
// Design Name: 
// Module Name:    sec0 
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
module sec0(
    clk_out,
	 rst_n,
	 increase,//要不要+1
	 value,
	 over//算完了沒
	 );



input clk_out;
input rst_n;
input increase;
output [3:0] value;
output over;

reg over;
reg [3:0] value;
reg [3:0] value_tmp;



always@(*)
begin
	if(value==4'd9 && increase==1'b1)
	begin
		value_tmp=4'd0;
		over=1'b1;
	end
	else if(value!=4'd9 && increase==1'b1)
	begin
		value_tmp=value+4'd1;
		over=1'b0;
	end
	else
	begin
		value_tmp=value;
		over=1'b0;
	end
end



always@(posedge clk_out or negedge rst_n)
begin
	if(~rst_n)
		value<=4'd0;
	else
		value<=value_tmp;
end



endmodule
