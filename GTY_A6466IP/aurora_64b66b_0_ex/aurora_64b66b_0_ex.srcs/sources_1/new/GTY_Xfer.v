`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/09 14:31:29
// Design Name: 
// Module Name: GTY_Xfer
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


module GTY_Xfer(
    input user_clk_i,
    input system_reset_i, //高电平复位
    input channel_up_i,
    input  tx_tready_i,
    output reg[255:0]tx_tdata_i,
    output reg tx_tvalid_i
    );

wire local_rst;
assign local_rst = system_reset_i | !channel_up_i;
always @(posedge user_clk_i or posedge local_rst) begin
    if(local_rst == 1)begin
        tx_tvalid_i <= 0;
    end else begin
        tx_tvalid_i <= 1;
    end
end
always @(posedge user_clk_i or posedge local_rst) begin
    if(local_rst == 1)begin
        tx_tdata_i <= 0;
    end else if(tx_tready_i)begin
        tx_tdata_i <= tx_tdata_i + 1;
        if(tx_tdata_i == 1000)begin
            tx_tdata_i <= 0;    
        end 
    end
end
endmodule