#/bin/bash

source ./tools/config.sh

CAMERA_REPO_URL="https://github.com/espressif/esp32-camera.git"

#
# CLONE/UPDATE ESP32-CAMERA
#
echo "Updating ESP32 Camera..."
if [ ! -d "$AR_COMPS/esp32-camera" ]; then
       git clone -b master --recursive --depth 1 --shallow-submodule $CAMERA_REPO_URL "$AR_COMPS/esp32-camera"
else
       cd "$AR_COMPS/esp32-camera"
       git pull
       git submodule update --depth 1
       # -ff is for cleaning untracked files as well as submodules
       git clean -ffdx
       cd -
fi
if [ $? -ne 0 ]; then exit 1; fi

#
# Arduino needs cam_hal.h from esp32-camera in include folder
#
cp "$AR_COMPS/esp32-camera/driver/private_include/cam_hal.h" "$AR_COMPS/esp32-camera/driver/include/"
