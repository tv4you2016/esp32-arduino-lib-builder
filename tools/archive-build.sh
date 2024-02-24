#!/bin/bash

idf_version_string=${IDF_BRANCH//\//_}"-$IDF_COMMIT"

archive_path="dist/arduino-esp32-libs-$idf_version_string.tar.gz"
build_archive_path="dist/arduino-esp32-build-$idf_version_string.tar.gz"
pio_archive_path="dist/framework-arduinoespressif32-$idf_version_string.tar.gz"
pio_zip_archive_path="dist/framework-arduinoespressif32-$idf_version_string.zip"

mkdir -p dist && rm -rf "$archive_path" "$build_archive_path"

cd out
echo "Creating PlatformIO framework-arduinoespressif32"
mkdir -p arduino-esp32/cores/esp32
mkdir -p arduino-esp32/tools/partitions
cp -rf ../components/arduino/tools arduino-esp32
cp -rf ../components/arduino/cores arduino-esp32
cp -rf ../components/arduino/libraries arduino-esp32
cp -rf ../components/arduino/variants arduino-esp32
cp -f ../components/arduino/CMa* arduino-esp32
cp -f ../components/arduino/idf* arduino-esp32
cp -f ../components/arduino/Kco* arduino-esp32
cp -f ../components/arduino/pac* arduino-esp32
rm -rf arduino-esp32/tools/esp32-arduino-libs
rm -rf arduino-esp32/tools/esptool.py
rm -rf arduino-esp32/tools/get.py
rm -rf arduino-esp32/tools/get.exe
rm -rf arduino-esp32/tools/ide-debug
rm -rf arduino-esp32/package.json
cp -Rf tools/esp32-arduino-libs arduino-esp32/tools/
cp ../package.json arduino-esp32/package.json
cp ../core_version.h arduino-esp32/cores/esp32/core_version.h

# Replace FRAMEWORK_LIBS_DIR path from extern installed package to stored in framework
org="platform.get_package_dir(\"framework-arduinoespressif32-libs\")"
repl="join(FRAMEWORK_DIR,\"tools\",\"esp32-arduino-libs\")"
echo "Replace FRAMEWORK_LIBS_DIR=$org with FRAMEWORK_LIBS_DIR=$repl"
gawk -i inplace  -v cuv1="platform.get_package_dir(\"framework-arduinoespressif32-libs\")" -v cuv2="join(FRAMEWORK_DIR,\"tools\",\"esp32-arduino-libs\")" '{gsub(cuv1,cuv2); print;}' "arduino-esp32/tools/platformio-build.py"

mv arduino-esp32/ framework-arduinoespressif32/

# If the framework is needed as tar.gz uncomment next line
# tar --exclude=.* -zcf ../$pio_archive_path framework-arduinoespressif32/
7z a -mx=9 -tzip -xr'!.*' ../$pio_zip_archive_path framework-arduinoespressif32/
