#/bin/bash

source ./tools/config.sh

TINYUSB_REPO_URL="https://github.com/hathach/tinyusb.git"
TINYUSB_REPO_DIR="$AR_COMPS/arduino_tinyusb/tinyusb"

#
# CLONE/UPDATE TINYUSB
#
echo "Updating TinyUSB..."
if [ ! -d "$TINYUSB_REPO_DIR" ]; then
       git clone -b master --depth 1 "$TINYUSB_REPO_URL" "$TINYUSB_REPO_DIR"
       # from right before Keyboard LED problem  - No issue found
       # git checkout 69313ef45564cc8967575f47fb8c57371cbea470
       # from right after Keyboard LED problem - No issue found
       # git checkout 7fb8d3341ce2feb46b0bce0bef069d31cf080168
       # from feW DAYS after Keyboard LED problem COMMIT - Breaks LED
       # git checkout a435befcdeb6bbd40cf3ba342756f8d73f031957
       # Commit from April 26th, later. WORKS
       # git checkout ee9ad0f184752e4006ccfa6ae49b7ac83707d771
       # Last commit done the 26th April
       cd "$TINYUSB_REPO_DIR"
       git checkout 31b559370d29f5093979fc50de2ae415fa6612ce
       cd -
else
       cd $TINYUSB_REPO_DIR
       git pull
       # -ff is for cleaning untracked files as well as submodules
       git clean -ffdx
       git checkout 31b559370d29f5093979fc50de2ae415fa6612ce
fi
if [ $? -ne 0 ]; then exit 1; fi
