# Tasmota Arduino PlatformIO framework builder [![ESP32 builder](https://github.com/Jason2866/esp32-arduino-lib-builder/actions/workflows/push.yml/badge.svg)](https://github.com/Jason2866/esp32-arduino-lib-builder/actions/workflows/push.yml)[![GitHub Releases](https://img.shields.io/github/downloads/Jason2866/esp32-arduino-lib-builder/total?label=downloads)](https://github.com/Jason2866/esp32-arduino-lib-builder/releases/latest)

This repository contains the scripts that produce the libraries included with Tasmota esp32-arduino.

### Build on Ubuntu
```bash
sudo apt-get install git wget curl libssl-dev libncurses-dev flex bison gperf python3 python3-pip python3-setuptools python3-serial python3-click python3-cryptography python3-future python3-pyparsing python3-pyelftools cmake ninja-build ccache jq p7zip-full
sudo pip3 install --upgrade pip3
git clone https://github.com/Jason2866/esp32-arduino-lib-builder
cd esp32-arduino-lib-builder
./build.sh
```
### Development builds
Look in release and download a version. There is the Info of the used commits of IDF / Arduino.

### Stable Platformio Platform release including ESP32solo1
based on Arduino Core 2.0.10 and can be used with Platformio for the ESP32/ESP32solo1, ESP32C3, ESP32S2 and ESP32S3
```                  
[platformio]
platform = https://github.com/tasmota/platform-espressif32/releases/download/2023.06.04/platform-espressif32.zip
framework = arduino, espidf
```
to use the ESP32 Solo1 Arduino framework add in your env
```
[env:esp32solo1]
board = every esp32 board can be used
build_flags = -DFRAMEWORK_ARDUINO_SOLO1
```
The frameworks are here [https://github.com/tasmota/arduino-esp32/releases](https://github.com/tasmota/arduino-esp32/releases)


Clear all tags [https://stackoverflow.com/questions/44702757/how-to-remove-all-git-origin-and-local-tags](https://stackoverflow.com/questions/44702757/how-to-remove-all-git-origin-and-local-tags)
