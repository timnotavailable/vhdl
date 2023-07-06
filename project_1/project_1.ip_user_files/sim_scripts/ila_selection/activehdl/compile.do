vlib work
vlib activehdl

vlib activehdl/xpm
vlib activehdl/work
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap work activehdl/work
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../../project_1.srcs/sources_1/ip/ila_selection/hdl/verilog" \
"F:/Vivado/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"F:/Vivado/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"F:/Vivado/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work work -93 \
"../../../../project_1.srcs/sources_1/ip/ila_selection/sim/ila_selection.vhd" \

vlog -work work \
"glbl.v"

