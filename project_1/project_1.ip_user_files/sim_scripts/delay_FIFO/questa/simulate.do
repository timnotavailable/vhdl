onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib delay_FIFO_opt

do {wave.do}

view wave
view structure
view signals

do {delay_FIFO.udo}

run -all

quit -force
