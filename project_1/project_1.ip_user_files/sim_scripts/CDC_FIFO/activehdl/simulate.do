onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+CDC_FIFO -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.CDC_FIFO xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {CDC_FIFO.udo}

run -all

endsim

quit -force
