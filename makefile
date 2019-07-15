install_from_Ergodox_EZ:
	# the hex file is downloaded from https://configure.ergodox-ez.com/ergodox-ez/layouts/default/latest/0
	teensy_loader_cli -mmcu=atmega32u4 -w -v ergodox_ez_ergodox-ez-default-layout-v1-3-4_ZPKDr.hex
