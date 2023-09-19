`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/19 10:57:43
// Design Name: 
// Module Name: TOP
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


module TOP (
    input        INIT_CLK_P0,
    input        INIT_CLK_N0,
    input        GTYQ0_P0,      // GTX Reference Clock Interface
    input        GTYQ0_N0,
    input  [0:3] RXP0,          // GTX Serial I/O
    input  [0:3] RXN0,
    output [0:3] TXP0,
    output [0:3] TXN0,
    output       qsfp0_lpmode,
    output       qsfp0_rstn,
    input        qsfp0_init,
    input        qsfp0_modprsn,

    input        INIT_CLK_P1,
    input        INIT_CLK_N1,
    input        GTYQ0_P1,      // GTX Reference Clock Interface
    input        GTYQ0_N1,
    input  [0:3] RXP1,          // GTX Serial I/O
    input  [0:3] RXN1,
    output [0:3] TXP1,
    output [0:3] TXN1,
    output       qsfp1_lpmode,
    output       qsfp1_rstn,
    input        qsfp1_init,
    input        qsfp1_modprsn

);

  assign qsfp0_lpmode = 1'b0;
  assign qsfp1_lpmode = 1'b0;

  assign qsfp1_rstn   = 1'b1;
  assign qsfp1_rstn   = 1'b1;
  
  aurora_64b66b_0_exdes aurora_64b66b_0_exdes (
      .INIT_CLK_P  (INIT_CLK_P0),
      .INIT_CLK_N  (INIT_CLK_N0),
      .GTYQ0_P     (GTYQ0_P0),
      .GTYQ0_N     (GTYQ0_N0),
      .RXP         (RXP0),
      .RXN         (RXN0),
      .TXP         (TXP0),
      .TXN         (TXN0),
      .channel_up_i(),
      .led4        ()
  );

  aurora_64b66b_1_exdes aurora_64b66b_1_exdes (
      .INIT_CLK_P  (INIT_CLK_P1),
      .INIT_CLK_N  (INIT_CLK_N1),
      .GTYQ0_P     (GTYQ0_P1),
      .GTYQ0_N     (GTYQ0_N1),
      .RXP         (RXP1),
      .RXN         (RXN1),
      .TXP         (TXP1),
      .TXN         (TXN1),
      .channel_up_i(),
      .led4        ()
  );

endmodule
