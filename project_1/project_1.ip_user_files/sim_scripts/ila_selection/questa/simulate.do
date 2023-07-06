onbreak {quit -f}
onerror {quit -f}

vsim -lib work ila_selection_opt

do {wave.do}

view wave
view structure
view signals

do {ila_selection.udo}

run -all

quit -force
