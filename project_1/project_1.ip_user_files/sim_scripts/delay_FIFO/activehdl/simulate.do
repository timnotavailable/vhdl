onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+delay_FIFO -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.delay_FIFO xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {delay_FIFO.udo}

run -all

endsim

quit -force
