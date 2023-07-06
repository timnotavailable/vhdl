onbreak {quit -f}
onerror {quit -f}

vsim -lib work ila_spi_opt

do {wave.do}

view wave
view structure
view signals

do {ila_spi.udo}

run -all

quit -force
