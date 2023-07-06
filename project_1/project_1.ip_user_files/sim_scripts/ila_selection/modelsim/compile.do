vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/work
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap work modelsim_lib/msim/work
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm  -incr -sv "+incdir+../../../../project_1.srcs/sources_1/ip/ila_selection/hdl/verilog" \
"F:/Vivado/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"F:/Vivado/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93 \
"F:/Vivado/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work work  -93 \
"../../../../project_1.srcs/sources_1/ip/ila_selection/sim/ila_selection.vhd" \

vlog -work work \
"glbl.v"

