.PHONY: ORYX QMK

ORYX:
	# the hex file is downloaded from https://configure.ergodox-ez.com/ergodox-ez/layouts/default/latest/0
	teensy_loader_cli -mmcu=atmega32u4 -w -v Oryx/ergodox_ez_ergodox-ez-default-layout-v1-3-4_ZPKDr.hex

QMK:
	teensy_loader_cli -mmcu=atmega32u4 -w -v QMK/ergodox_ez_default.hex

avr-gcc-4:
	teensy_loader_cli -mmcu=atmega32u4 -w -v QMK-avr-gcc-4/ergodox_ez_default.hex

356:
	teensy_loader_cli -mmcu=atmega32u4 -w -v QMK-0.6.356/ergodox_ez_default.hex
