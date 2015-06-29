#!/bin/sh
#
#sh for miui patchrom
BUILD_NUMBER=$1
LAST_TARGET_ZIP=$2
if [ $# != 2 ];then
    echo "Usage: ./auto_make.sh   BUILD_NUMBER   LAST_TARGET_ZIP"
    exit
fi
cd ..
. build/envsetup.sh
cd -
make clean
make fullota BUILD_NUMBER=$BUILD_NUMBER
cp out/fullota.zip $BUILD_NUMBER-fullota.zip
../tools/releasetools/ota_from_target_files -k ../build/security/testkey -i $LAST_TARGET_ZIP out/target_files.zip OTA-$LAST_TARGET_ZIP-$BUILD_NUMBER.zip
cp out/target_files.zip $BUILD_NUMBER-target.zip
make clean
