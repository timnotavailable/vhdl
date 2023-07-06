onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -L xpm -L work -L unisims_ver -L unimacro_ver -L secureip -lib work work.ila_selection work.glbl

do {wave.do}

view wave
view structure
view signals

do {ila_selection.udo}

run -all

quit -force
