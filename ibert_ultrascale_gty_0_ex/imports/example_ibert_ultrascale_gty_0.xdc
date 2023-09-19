
# file: ibert_ultrascale_gty_0.xdc
####################################################################################
##   ____  ____ 
##  /   /\/   /
## /___/  \  /    Vendor: Xilinx
## \   \   \/     Version : 2012.3
##  \   \         Application : IBERT Ultrascale
##  /   /         Filename : example_ibert_ultrascale_gty_0.xdc
## /___/   /\     
## \   \  /  \ 
##  \___\/\___\
##
##
## 
## Generated by Xilinx IBERT Ultrascale
##**************************************************************************
##
## Icon Constraints
##

set_property C_CLK_INPUT_FREQ_HZ 100000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER true [get_debug_cores dbg_hub]
##
##gtrefclk lock constraints
##
 
set_property PACKAGE_PIN AN11 [get_ports gty_refclk0p_i[0]]
set_property PACKAGE_PIN AN10 [get_ports gty_refclk0n_i[0]]
set_property PACKAGE_PIN AL11 [get_ports gty_refclk1p_i[0]]
set_property PACKAGE_PIN AL10 [get_ports gty_refclk1n_i[0]]

 
set_property PACKAGE_PIN AJ11 [get_ports gty_refclk0p_i[1]]
set_property PACKAGE_PIN AJ10 [get_ports gty_refclk0n_i[1]]
set_property PACKAGE_PIN AG11 [get_ports gty_refclk1p_i[1]]
set_property PACKAGE_PIN AG10 [get_ports gty_refclk1n_i[1]]
##
## Refclk constraints
##

create_clock -name gtrefclk0_13 -period 10.0 [get_ports gty_refclk0p_i[0]]
create_clock -name gtrefclk1_13 -period 10.0 [get_ports gty_refclk1p_i[0]]
set_clock_groups -group [get_clocks gtrefclk0_13 -include_generated_clocks] -asynchronous
set_clock_groups -group [get_clocks gtrefclk1_13 -include_generated_clocks] -asynchronous
 
create_clock -name gtrefclk0_16 -period 10.0 [get_ports gty_refclk0p_i[1]]
create_clock -name gtrefclk1_16 -period 10.0 [get_ports gty_refclk1p_i[1]]
set_clock_groups -group [get_clocks gtrefclk0_16 -include_generated_clocks] -asynchronous
set_clock_groups -group [get_clocks gtrefclk1_16 -include_generated_clocks] -asynchronous