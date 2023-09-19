`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/09 14:52:36
// Design Name: 
// Module Name: GTY_Recv
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module GTY_Recv(
    input user_clk_i,
    input system_reset_i, //高电平复位
    input channel_up_i, 
    input [255:0] rx_tdata_i,
    input rx_tvalid_i,
    output reg  led4,
    output error 
    );

wire local_rst;
assign local_rst = system_reset_i | !channel_up_i;
reg [255:0]rd_cnt;
always @(posedge user_clk_i or posedge local_rst) begin
    if(local_rst == 1)begin
        rd_cnt <= 0;
    end else if(rx_tvalid_i)begin
        rd_cnt <= rd_cnt + 1;
        if(rd_cnt == 1000)begin
            rd_cnt <= 0;
        end
    end
end
assign error = rx_tvalid_i & (rd_cnt != rx_tdata_i);
always @(posedge user_clk_i or posedge local_rst) begin
    if(local_rst == 1)begin
        led4 <= 0;
    end else if(error)begin
        led4 <= 1;
    end
end 
endmodule
