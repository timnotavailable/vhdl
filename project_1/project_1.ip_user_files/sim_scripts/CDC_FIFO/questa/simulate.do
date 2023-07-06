onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib CDC_FIFO_opt

do {wave.do}

view wave
view structure
view signals

do {CDC_FIFO.udo}

run -all

quit -force
