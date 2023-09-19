 ///////////////////////////////////////////////////////////////////////////////
 //
 // Project:  Aurora 64B/66B
 // Company:  Xilinx
 //
 //
 //
 // (c) Copyright 2008 - 2009 Xilinx, Inc. All rights reserved.
 //
 // This file contains confidential and proprietary information
 // of Xilinx, Inc. and is protected under U.S. and
 // international copyright and other intellectual property
 // laws.
 //
 // DISCLAIMER
 // This disclaimer is not a license and does not grant any
 // rights to the materials distributed herewith. Except as
 // otherwise provided in a valid license issued to you by
 // Xilinx, and to the maximum extent permitted by applicable
 // law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
 // WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
 // AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
 // BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
 // INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
 // (2) Xilinx shall not be liable (whether in contract or tort,
 // including negligence, or under any other theory of
 // liability) for any loss or damage of any kind or nature
 // related to, arising under or in connection with these
 // materials, including for any direct, or any indirect,
 // special, incidental, or consequential loss or damage
 // (including loss of data, profits, goodwill, or any type of
 // loss or damage suffered as a result of any action brought
 // by a third party) even if such damage or loss was
 // reasonably foreseeable or Xilinx had been advised of the
 // possibility of the same.
 //
 // CRITICAL APPLICATIONS
 // Xilinx products are not designed or intended to be fail-
 // safe, or for use in any application requiring fail-safe
 // performance, such as life-support or safety devices or
 // systems, Class III medical devices, nuclear facilities,
 // applications related to the deployment of airbags, or any
 // other applications that could lead to death, personal
 // injury, or severe property or environmental damage
 // (individually and collectively, "Critical
 // Applications"). Customer assumes the sole risk and
 // liability of any use of Xilinx products in Critical
 // Applications, subject only to applicable laws and
 // regulations governing limitations on product liability.
 //
 // THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
 // PART OF THIS FILE AT ALL TIMES.

 //
 ///////////////////////////////////////////////////////////////////////////////
 //
 //  EXAMPLE_DESIGN
 //
 //
 //  Description:  This module instantiates 4 lane Aurora Module.
 //                Used to exhibit functionality in hardware using the example design
 //                The User Interface is connected to Data Generator and Checker.
 ///////////////////////////////////////////////////////////////////////////////

 // aurora sample file, example design

 `timescale 1 ns / 10 ps

   (* core_generation_info = "aurora_64b66b_0,aurora_64b66b_v12_0_3,{c_aurora_lanes=4,c_column_used=left,c_gt_clock_1=GTYQ0,c_gt_clock_2=None,c_gt_loc_1=1,c_gt_loc_10=X,c_gt_loc_11=X,c_gt_loc_12=X,c_gt_loc_13=X,c_gt_loc_14=X,c_gt_loc_15=X,c_gt_loc_16=X,c_gt_loc_17=X,c_gt_loc_18=X,c_gt_loc_19=X,c_gt_loc_2=2,c_gt_loc_20=X,c_gt_loc_21=X,c_gt_loc_22=X,c_gt_loc_23=X,c_gt_loc_24=X,c_gt_loc_25=X,c_gt_loc_26=X,c_gt_loc_27=X,c_gt_loc_28=X,c_gt_loc_29=X,c_gt_loc_3=3,c_gt_loc_30=X,c_gt_loc_31=X,c_gt_loc_32=X,c_gt_loc_33=X,c_gt_loc_34=X,c_gt_loc_35=X,c_gt_loc_36=X,c_gt_loc_37=X,c_gt_loc_38=X,c_gt_loc_39=X,c_gt_loc_4=4,c_gt_loc_40=X,c_gt_loc_41=X,c_gt_loc_42=X,c_gt_loc_43=X,c_gt_loc_44=X,c_gt_loc_45=X,c_gt_loc_46=X,c_gt_loc_47=X,c_gt_loc_48=X,c_gt_loc_5=X,c_gt_loc_6=X,c_gt_loc_7=X,c_gt_loc_8=X,c_gt_loc_9=X,c_lane_width=4,c_line_rate=10.3125,c_gt_type=GTYE4,c_qpll=true,c_nfc=false,c_nfc_mode=IMM,c_refclk_frequency=156.25,c_simplex=false,c_simplex_mode=TX,c_stream=true,c_ufc=false,c_user_k=false,flow_mode=None,interface_mode=Streaming,dataflow_config=Duplex}" *)
(* DowngradeIPIdentifiedWarnings="yes" *)
 module aurora_64b66b_1_exdes (
    // input       RESET,
    input       INIT_CLK_P,
    input       INIT_CLK_N,
    // output  reg HARD_ERR,// Error Detection Interface
    // output  reg SOFT_ERR,
    // output  reg SYSTEM_RST, //用于数据生成与接收(应该与CHANNEL_UP同时作为复位信号)
    // output  reg [0:3]LANE_UP,// Status
    // output  reg CHANNEL_UP,
    // input       INIT_CLK100,// System Interface
    // input       PMA_INIT,
    input       GTYQ0_P,// GTX Reference Clock Interface
    input       GTYQ0_N,
    input       [0:3]RXP,// GTX Serial I/O
    input       [0:3]RXN,   
    output      [0:3]TXP,
    output      [0:3]TXN,
    output      channel_up_i,  //通道指示
    output      led4
    //TX Interface
    // input       [255:0]tx_tdata_i, 
    // input        tx_tvalid_i,
    // output       tx_tready_i,
    // //RX Interface
    // output      [255:0]rx_tdata_i,  
    // output      rx_tvalid_i

 );
//test 测试收发
wire PMA_INIT;
wire RESET;
wire INIT_CLK100;
assign PMA_INIT = 0;
assign RESET = 0;
  IBUFDS init_clk_ibufg_i
  (
   .I(INIT_CLK_P),
   .IB(INIT_CLK_N),
   .O(INIT_CLK100)
  );
//数据生成与发送
wire tx_tready_i;
wire [255:0]tx_tdata_i;
wire tx_tvalid_i;
GTY_Xfer sub1_xfer(
  .user_clk_i(user_clk_i),
  .system_reset_i(system_reset_i),
  .channel_up_i(channel_up_i),
  .tx_tready_i(tx_tready_i),
  .tx_tdata_i(tx_tdata_i),
  .tx_tvalid_i(tx_tvalid_i)
);
//数据的接收与check
wire [255:0] rx_tdata_i;
wire rx_tvalid_i;
wire  error;
GTY_Recv sub2_recv(
  .user_clk_i(user_clk_i),
  .system_reset_i(system_reset_i),
  .channel_up_i(channel_up_i),
  .rx_tdata_i(rx_tdata_i),
  .rx_tvalid_i(rx_tvalid_i),
  .led4(led4),
  .error(error)
);
//ILA检测各个信号
ila_0 your_instance_name (
	.clk(user_clk_i), // input wire clk
	.probe0({error,led4,rx_tvalid_i,channel_up_i,tx_tvalid_i,tx_tready_i,lane_up_i}), // input wire [7:0]  probe0  
	.probe1({rx_tdata_i,tx_tdata_i}) // input wire [511:0]  probe1
);
 `define DLY #1
//____________________________wire define User I/O___________________________________
wire      user_clk_i;
wire      sync_clk_i;
wire      gt_reset_i;
wire      hard_err_i;//Error Detection Interface
wire      soft_err_i;
wire      channel_up_i;//Status
wire[0:3] lane_up_i;
reg       reset_r3 ;
wire      gt_pll_lock_i ;
wire      link_reset_i;
wire      bufg_gt_clr_out;
wire      system_reset_i;
wire      pll_not_locked_i;
wire      tx_out_clk_i;
// Register User Outputs from core.

// always @(posedge user_clk_i)
//   begin 
//     HARD_ERR         <=  hard_err_i;
//     SOFT_ERR         <=  soft_err_i;
//     LANE_UP          <=  lane_up_i;
//     CHANNEL_UP       <=  channel_up_i;
//     SYSTEM_RST       <=  system_reset_i;
//   end
//两个复位逻辑  第一个是reset_pb信号，用于GT内部逻辑复位；一个是gt_reset_i用于pma_init
//在释放复位的时候，
//在延迟三拍之后，先释放reset_pb信号，内部逻辑不再重置；然后128 INIT_CLK之后释放pma_init
//在工作状态进入复位时，RESET系统复位只复位逻辑部分，不在复位pma_init部分；当PMA_INIT指示来的时候，
//打三拍后内部逻辑复位，还是128INITCLK后复位
//高电平复位，因此 PMA_INIT信号应该拉低为0

//1.reset_pb信号复位逻辑
wire      reset_i ;
wire      gt_reset_i_tmp;
wire      gt_reset_i_tmp2;
wire      gt_reset_i_eff;
assign gt_reset_i_tmp = PMA_INIT; 
aurora_64b66b_1_rst_sync_exdes   u_rst_sync_gtrsttmpi(//延迟三拍
  .prmry_in     (gt_reset_i_tmp),
  .scndry_aclk  (user_clk_i),
  .scndry_out   (gt_reset_i_tmp2)
);
assign  reset_i  =   RESET | gt_reset_i_tmp2; //先释放reset_pb信号，内部逻辑不再重置
always @(posedge user_clk_i)begin
  reset_r3 <= `DLY reset_i; //输入到reset_pb信号
end

//2.pma_init信号 复位逻辑
reg [127:0]        pma_init_stage = {128{1'b1}};
wire gt_reset_i_delayed;
reg pma_init_assertion = 1'b0;
reg gt_reset_i_delayed_r1;
reg gt_reset_i_delayed_r2;
reg [23:0]pma_init_pulse_width_cnt = 24'h0;
always @(posedge INIT_CLK100)begin
  pma_init_stage[127:0] <= {pma_init_stage[126:0], gt_reset_i_tmp};//延时128 CLK
end
assign gt_reset_i_delayed = pma_init_stage[127];       
always @(posedge INIT_CLK100)begin
  gt_reset_i_delayed_r1     <=  gt_reset_i_delayed;
  gt_reset_i_delayed_r2     <=  gt_reset_i_delayed_r1;//上升沿
  if(~gt_reset_i_delayed_r2 & gt_reset_i_delayed_r1 & ~pma_init_assertion & (pma_init_pulse_width_cnt != 24'hFFFFFF))
      pma_init_assertion <= 1'b1;
  else if (pma_init_assertion & pma_init_pulse_width_cnt == 24'hFFFFFF)
      pma_init_assertion <= 1'b0;

  if(pma_init_assertion)
      pma_init_pulse_width_cnt <= pma_init_pulse_width_cnt + 24'h1;
end       
assign gt_reset_i_eff = pma_init_assertion ? 1'b1 : gt_reset_i_delayed;
assign  gt_reset_i = gt_reset_i_eff;    
    
// this is non shared mode, the clock, GT common are part of example design.
aurora_64b66b_1_support aurora_64b66b_1_block_i(
   // TX AXI4-S Interface
    .s_axi_tx_tdata     (tx_tdata_i) , //接数据生成模块
    .s_axi_tx_tvalid    (tx_tvalid_i),
    .s_axi_tx_tready    (tx_tready_i),
   // RX AXI4-S Interface
    .m_axi_rx_tdata     (rx_tdata_i) , //接数据接收模块
    .m_axi_rx_tvalid    (rx_tvalid_i),
   // GT Serial I/O
    .rxp                (RXP),
    .rxn                (RXN),
    .txp                (TXP),
    .txn                (TXN),
   //GT Reference Clock Interface
   .gt_refclk1_p        (GTYQ0_P),
   .gt_refclk1_n        (GTYQ0_N),
   // Error Detection Interface
    .hard_err           (hard_err_i)  ,//硬件错误
    .soft_err           (soft_err_i)  ,//软件错误
   // Status
    .channel_up         (channel_up_i),//初始化完成，通道建立
    .lane_up            (lane_up_i)   ,//lane初始化完成
   // System Interface
    .user_clk_out       (user_clk_i)  ,//用户时钟
    .sync_clk_out       (sync_clk_i)  , //没用到
    .reset_pb           (reset_r3)    ,//当这个信号置高时，它将触发IP的内部重置逻辑，用于清除和恢复内部状态。
    .gt_rxcdrovrden_in  (1'b0)        ,//它用于启用或禁用CDR覆盖功能
    .power_down         (1'b0)        ,//当将其置高时，它将触发电源关闭逻辑，将Aurora IP模块进入低功耗模式
    .loopback           (3'b0)        ,//内部环路
    .pma_init           (gt_reset_i)  ,//这个信号表示enable物理介质适配器（PMA）的初始化信号
    .gt_pll_lock        (gt_pll_lock_i),//表示收发器的PLL（Phase-Locked Loop，锁相环）锁定状态。当这个信号为高电平时，表示接收端的PLL已成功锁定输入时钟频率和相位。
    //---------------------- GT DRP Ports ----------------------
    .gt0_drpaddr        (10'h0),
    .gt0_drpdi          (16'h0),
    .gt0_drpdo          ()     , 
    .gt0_drprdy         ()     , 
    .gt0_drpen          (1'b0) , 
    .gt0_drpwe          (1'b0) , 
    .gt1_drpaddr        (10'h0),
    .gt1_drpdi          (16'h0),
    .gt1_drpdo          ()     ,  
    .gt1_drprdy         ()     , 
    .gt1_drpen          (1'b0) , 
    .gt1_drpwe          (1'b0) , 
    .gt2_drpaddr        (10'h0),
    .gt2_drpdi          (16'h0),
    .gt2_drpdo          ()     , 
    .gt2_drprdy         ()     , 
    .gt2_drpen          (1'b0) , 
    .gt2_drpwe          (1'b0) , 
    .gt3_drpaddr        (10'h0),
    .gt3_drpdi          (16'h0),
    .gt3_drpdo          ()     , 
    .gt3_drprdy         ()     , 
    .gt3_drpen          (1'b0) , 
    .gt3_drpwe          (1'b0) , 
    .init_clk           (INIT_CLK100),
    .link_reset_out     (link_reset_i),//当这个信号置高时，它将触发Aurora链路的重置，清除链路状态并重新进行初始化。
    .mmcm_not_locked_out(pll_not_locked_i),//gao 表示MMCM尚未成功锁定输入时钟频率和相位
    .bufg_gt_clr_out    (bufg_gt_clr_out),//bufg_gt_clr_out信号表示BUFG_GT模块的清除输出。当该信号处于高电平时，它将清除与BUFG_GT相关的逻辑电路中的状态或寄存器。这通常用于重置或清除特定的逻辑电路，以确保其处于预期的初始状态。
    .sys_reset_out      (system_reset_i),//为高表示，系统处于复位状态
    .tx_out_clk         (tx_out_clk_i)
     );
 endmodule
