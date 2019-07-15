# CuriousCaseOfQMK

## The Problem
I cannot build and upload latest QMK from macOS

## Enviroment

```shell 
$ uname -a
Darwin Rocinante.local 18.6.0 Darwin Kernel Version 18.6.0: Thu Apr 25 23:16:27 PDT 2019; root:xnu-4903.261.4~2/RELEASE_X86_64 x86_64
```

## To reproduce

1. download latest [QMK firmware](https://github.com/qmk/qmk_firmware)
2. `./util/qmk_install.sh`
3. `make ergodox_ez:default`
4. use `teensy_loader_cli` to upload.
5. expecting *error writing to Teensy*

```shell
➜  CuriousCaseOfQMK git:(master) ✗ make QMK
teensy_loader_cli -mmcu=atmega32u4 -w -v QMK/ergodox_ez_default.hex
Teensy Loader, Command Line, Version 2.1
Read "QMK/ergodox_ez_default.hex": 25896 bytes, 80.3% usage
Waiting for Teensy device...
(hint: press the reset button)
Found HalfKay Bootloader
Read "QMK/ergodox_ez_default.hex": 25896 bytes, 80.3% usage
Programming..........................................................................................................................................................................error writing to Teensy
```

meanwhile, the [firmware download from Oryx](https://configure.ergodox-ez.com/ergodox-ez/layouts/default/latest/0) worked perfectly.

```shell
make: *** [QMK] Error 1
➜  CuriousCaseOfQMK git:(master) ✗ make ORYX
teensy_loader_cli -mmcu=atmega32u4 -w -v ORYX/ergodox_ez_ergodox-ez-default-layout-v1-3-4_ZPKDr.hex
Teensy Loader, Command Line, Version 2.1
Read "ORYX/ergodox_ez_ergodox-ez-default-layout-v1-3-4_ZPKDr.hex": 22060 bytes, 68.4% usage
Waiting for Teensy device...
(hint: press the reset button)
Found HalfKay Bootloader
Read "ORYX/ergodox_ez_ergodox-ez-default-layout-v1-3-4_ZPKDr.hex": 22060 bytes, 68.4% usage
Programming.............................................................................................................................................................................
Booting

```

## Log

* 2019-07-14 build `teensy_loader_cli` directly and tweek the timout and debug result. Looks like there's no *boot* event in QMK firmwire.

* 2019-07-15 downgrade to *QMK Firmware 0.6.356* with *avr-gcc 4.9.2*. My current setting is *QMK Firmware 0.6.414* with *avr-gcc 8.3.0*

