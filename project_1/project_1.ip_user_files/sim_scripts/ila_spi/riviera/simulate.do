onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+ila_spi -L work -L secureip -O5 work.ila_spi

do {wave.do}

view wave
view structure

do {ila_spi.udo}

run -all

endsim

quit -force
