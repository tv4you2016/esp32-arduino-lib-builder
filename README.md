# Tasmota ESP32 Arduino Lib Builder [![ESP32 builder](https://github.com/Jason2866/esp32-arduino-lib-builder/actions/workflows/push.yml/badge.svg)](https://github.com/Jason2866/esp32-arduino-lib-builder/actions/workflows/push.yml)

This repository contains the scripts that produce the libraries included with Tasmota esp32-arduino.

### Build on Ubuntu
```bash
sudo apt-get install git wget curl libssl-dev libncurses-dev flex bison gperf python3 python3-pip python3-setuptools python3-serial python3-click python3-cryptography python3-future python3-pyparsing python3-pyelftools cmake ninja-build ccache jq
sudo pip3 install --upgrade pip3
git clone https://github.com/Jason2866/esp32-arduino-lib-builder
cd esp32-arduino-lib-builder
./build.sh
```
### Development builds
Look in release and download a version. The day of build is using the commits of this day of IDF / Arduino.

### Stable Release
are based on Arduino Core 2.0.4 and can be used with Platformio for the ESP32, ESP32C3, ESP32S2 and ESP32S3
```                  
[platformio]
platform = https://github.com/tasmota/platform-espressif32/releases/download/v2.0.4.1/platform-espressif32-2.0.4.1.zip
framework = arduino, espidf
```
and for the ESP32solo1 with
```
[platformio]
platform = https://github.com/tasmota/platform-espressif32/releases/download/v2.0.4.1/platform-espressif32-solo1-2.0.4.1.zip
framework = arduino, espidf
```
The frameworks are here [https://github.com/tasmota/arduino-esp32/releases](https://github.com/tasmota/arduino-esp32/releases)
