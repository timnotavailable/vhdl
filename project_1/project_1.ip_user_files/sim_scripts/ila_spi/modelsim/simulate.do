onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -L work -L secureip -lib work work.ila_spi

do {wave.do}

view wave
view structure
view signals

do {ila_spi.udo}

run -all

quit -force
