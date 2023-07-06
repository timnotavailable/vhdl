onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+ila_selection -L xpm -L work -L unisims_ver -L unimacro_ver -L secureip -O5 work.ila_selection work.glbl

do {wave.do}

view wave
view structure

do {ila_selection.udo}

run -all

endsim

quit -force
