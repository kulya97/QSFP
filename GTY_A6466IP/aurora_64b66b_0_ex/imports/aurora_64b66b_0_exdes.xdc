 ##################################################################################
 ##
 ## Project:  Aurora 64B/66B
 ## Company:  Xilinx
 ##
 ##
 ##
 ## (c) Copyright 2008 - 2018 Xilinx, Inc. All rights reserved.
 ##
 ## This file contains confidential and proprietary information
 ## of Xilinx, Inc. and is protected under U.S. and
 ## international copyright and other intellectual property
 ## laws.
 ##
 ## DISCLAIMER
 ## This disclaimer is not a license and does not grant any
 ## rights to the materials distributed herewith. Except as
 ## otherwise provided in a valid license issued to you by
 ## Xilinx, and to the maximum extent permitted by applicable
 ## law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
 ## WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
 ## AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
 ## BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
 ## INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
 ## (2) Xilinx shall not be liable (whether in contract or tort,
 ## including negligence, or under any other theory of
 ## liability) for any loss or damage of any kind or nature
 ## related to, arising under or in connection with these
 ## materials, including for any direct, or any indirect,
 ## special, incidental, or consequential loss or damage
 ## (including loss of data, profits, goodwill, or any type of
 ## loss or damage suffered as a result of any action brought
 ## by a third party) even if such damage or loss was
 ## reasonably foreseeable or Xilinx had been advised of the
 ## possibility of the same.
 ##
 ## CRITICAL APPLICATIONS
 ## Xilinx products are not designed or intended to be fail-
 ## safe, or for use in any application requiring fail-safe
 ## performance, such as life-support or safety devices or
 ## systems, Class III medical devices, nuclear facilities,
 ## applications related to the deployment of airbags, or any
 ## other applications that could lead to death, personal
 ## injury, or severe property or environmental damage
 ## (individually and collectively, "Critical
 ## Applications"). Customer assumes the sole risk and
 ## liability of any use of Xilinx products in Critical
 ## Applications, subject only to applicable laws and
 ## regulations governing limitations on product liability.
 ##
 ## THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
 ## PART OF THIS FILE AT ALL TIMES.
 ##
 ###################################################################################################
 ##
 ##  aurora_64b66b_0_exdes
 ##
 ##  Description: This is the example design constraints file for a 4 lane Aurora
 ##               core.
 ##               This is example design xdc.
 ##               Note: User need to set proper IO standards for the LOC's mentioned below.
 ###################################################################################################

   # create clock constraints for init_clk
   create_clock -name init_clk_in -period 10.000	 [get_ports INIT_CLK_P]
   set_clock_groups -asynchronous -group [get_clocks init_clk_in -include_generated_clocks]

   # Reference clock contraint for GTX
   create_clock  -name gt_refclk1_in -period 10.000	 [get_ports GTYQ0_P]
   set_clock_groups -asynchronous -group [get_clocks gt_refclk1_in -include_generated_clocks]
  
   # false path constrints for example design paths
   set_false_path -to [get_pins -hier *aurora_64b66b_0_cdc_to*/D]
   # Reference clock location
   set_property LOC AN11 [get_ports GTYQ0_P]
   set_property LOC AN10 [get_ports GTYQ0_N]


################################################################################

#####################################################################################################
  ##Note: User should add LOC based upon the board
  #       Below LOC's are place holders and need to be changed as per the device and board
              #set_property LOC D17 [get_ports INIT_CLK_P]
              #set_property LOC D18 [get_ports INIT_CLK_N]
              #set_property LOC G19 [get_ports RESET]
              #set_property LOC K18 [get_ports PMA_INIT]
    
              #set_property LOC A20 [get_ports CHANNEL_UP]
              #set_property LOC A17 [get_ports LANE_UP[0]]
	          #set_property LOC A16 [get_ports LANE_UP[1]]
	          #set_property LOC B20 [get_ports LANE_UP[2]]
	          #set_property LOC C20  [get_ports LANE_UP[3]]
               #set_property LOC Y15 [get_ports HARD_ERR]   
               #set_property LOC AH10 [get_ports SOFT_ERR]   
               #set_property LOC AD16 [get_ports DATA_ERR_COUNT[0]]   
               #set_property LOC Y19 [get_ports DATA_ERR_COUNT[1]]   
               #set_property LOC Y18 [get_ports DATA_ERR_COUNT[2]]   
               #set_property LOC AA18 [get_ports DATA_ERR_COUNT[3]]   
               #set_property LOC AB18 [get_ports DATA_ERR_COUNT[4]]   
               #set_property LOC AB19 [get_ports DATA_ERR_COUNT[5]]   
               #set_property LOC AC19 [get_ports DATA_ERR_COUNT[6]]   
               #set_property LOC AB17 [get_ports DATA_ERR_COUNT[7]]   
    
    
  ##Note: User should add IOSTANDARD based upon the board
  #       Below IOSTANDARD's are place holders and need to be changed as per the device and board
              #set_property IOSTANDARD LVDS_25 [get_ports INIT_CLK_P]
              #set_property IOSTANDARD LVDS_25 [get_ports INIT_CLK_N]
              #set_property IOSTANDARD LVCMOS18 [get_ports RESET]
              #set_property IOSTANDARD LVCMOS18 [get_ports PMA_INIT]
    
              #set_property IOSTANDARD LVCMOS18 [get_ports CHANNEL_UP]
              #set_property IOSTANDARD LVCMOS18 [get_ports LANE_UP[0]]
	          #set_property IOSTANDARD LVCMOS18 [get_ports LANE_UP[1]]
	          #set_property IOSTANDARD LVCMOS18 [get_ports LANE_UP[2]]
	          #set_property IOSTANDARD LVCMOS18  [get_ports LANE_UP[3]]
               #set_property IOSTANDARD LVCMOS18 [get_ports HARD_ERR]   
               #set_property IOSTANDARD LVCMOS18 [get_ports SOFT_ERR]   
               #set_property IOSTANDARD LVCMOS18 [get_ports DATA_ERR_COUNT[0]]   
               #set_property IOSTANDARD LVCMOS18 [get_ports DATA_ERR_COUNT[1]]   
               #set_property IOSTANDARD LVCMOS18 [get_ports DATA_ERR_COUNT[2]]   
               #set_property IOSTANDARD LVCMOS18 [get_ports DATA_ERR_COUNT[3]]   
               #set_property IOSTANDARD LVCMOS18 [get_ports DATA_ERR_COUNT[4]]   
               #set_property IOSTANDARD LVCMOS18 [get_ports DATA_ERR_COUNT[5]]   
               #set_property IOSTANDARD LVCMOS18 [get_ports DATA_ERR_COUNT[6]]   
               #set_property IOSTANDARD LVCMOS18 [get_ports DATA_ERR_COUNT[7]]   
    
    


