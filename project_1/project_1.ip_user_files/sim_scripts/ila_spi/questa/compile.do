vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/work
vlib questa_lib/msim/xil_defaultlib

vmap work questa_lib/msim/work
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vcom -work work  -93 \
"../../../../project_1.srcs/sources_1/ip/ila_spi/sim/ila_spi.vhd" \


