vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm  -incr -sv "+incdir+../../../../project_1.srcs/sources_1/ip/MMCM" \
"F:/Vivado/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm  -93 \
"F:/Vivado/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../../project_1.srcs/sources_1/ip/MMCM/MMCM_sim_netlist.vhdl" \


vlog -work xil_defaultlib \
"glbl.v"
