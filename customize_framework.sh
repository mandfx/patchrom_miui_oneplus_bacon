#!/bin/bash

OUT_MIUI_FRAMEWORK_DIR=$1
OUT_FRAMEWORK_DIR=$2

if [ "$OUT_FRAMEWORK_DIR" == "out/framework" ];then
    cp $OUT_MIUI_FRAMEWORK_DIR/smali/android/widget/Editor*.smali $OUT_FRAMEWORK_DIR/smali/android/widget/
    rm -rf $OUT_FRAMEWORK_DIR/smali/com/android/internal/app/ResolverProxy*.smali
    
    #density
    sed -i 's/qemu.sf.lcd_density/persist.sys.density/g' $2/smali/android/util/DisplayMetrics.smali
fi

if [ "$OUT_FRAMEWORK_DIR" == "out/services" ];then
    cp $OUT_MIUI_FRAMEWORK_DIR/smali/com/android/server/power/ShutdownThread*.smali $OUT_FRAMEWORK_DIR/smali/com/android/server/power/
fi