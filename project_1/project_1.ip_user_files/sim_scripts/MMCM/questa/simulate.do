onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib MMCM_opt

do {wave.do}

view wave
view structure
view signals

do {MMCM.udo}

run -all

quit -force