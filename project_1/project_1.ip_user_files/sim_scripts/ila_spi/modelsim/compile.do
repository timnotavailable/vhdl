vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/work
vlib modelsim_lib/msim/xil_defaultlib

vmap work modelsim_lib/msim/work
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vcom -work work  -93 \
"../../../../project_1.srcs/sources_1/ip/ila_spi/sim/ila_spi.vhd" \


