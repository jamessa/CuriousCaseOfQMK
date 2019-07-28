# CuriousCaseOfQMK

## Problem Description

I cannot boot latest QMK firmware on Teensy 2.0 using macOS Mojave.

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
make: *** [QMK] Error 1
```

but the [firmware download from Oryx](https://configure.ergodox-ez.com/ergodox-ez/layouts/default/latest/0) worked perfectly.

```shell
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

`brew install avr-gcc@4` didn't work. Checkout `make avr-gcc-4`

trying out `git checkout 0.6.356`... still didn't work. Checkuout `make 356`

2019-7-15 

by adding `LINK_TIME_OPTIMIZATION_ENABLE = yes` to rule.mk fixed the issue. Case closed, it's a build issue. Pull request here https://github.com/qmk/qmk_firmware/pull/6339

2019-7-28 

I got real Teensy 2.0 from [PJRC](https://www.pjrc.com/store/teensy.html) and ALL problem fixed. The root cause is counterfeit Teensy 2.0 board.

![Upload Testing](screenshot.jpg)

(Real) Teensy 2.0 from PJRC
![Teensy 2.0](/Users/james/Projects/CuriousCaseOfQMK/Teensy20.jpg)

Counterfeit Teensy 2.0 from Taobao
![Counterfeit Teensy 2.0 from Taobao](/Users/james/Projects/CuriousCaseOfQMK/CounterfeitTeensy20.jpg)