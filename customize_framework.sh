#!/bin/bash

OUT_MIUI_FRAMEWORK_DIR=$1
OUT_FRAMEWORK_DIR=$2
GIT_APPLY=$PORT_ROOT/tools/git.apply

function applyPatch () {
    for patch in `find $1 -name *.patch`
    do
        cp $patch out/
        cd out
        $GIT_APPLY `basename $patch`
        for rej in `find $2 -name *.rej`
        do
          echo "Patch $patch fail"
          exit 1
        done
        cd ..
      done
}

if [ "$OUT_FRAMEWORK_DIR" == "out/framework" ];then
    cp $OUT_MIUI_FRAMEWORK_DIR/smali/android/widget/Editor*.smali $OUT_FRAMEWORK_DIR/smali/android/widget/
    rm -rf $OUT_FRAMEWORK_DIR/smali/com/android/internal/app/ResolverProxy*.smali
    
    #density
    sed -i 's/qemu.sf.lcd_density/persist.sys.density/g' $2/smali/android/util/DisplayMetrics.smali
fi

if [ "$OUT_FRAMEWORK_DIR" == "out/services" ];then
    cp $OUT_MIUI_FRAMEWORK_DIR/smali/com/android/server/power/ShutdownThread*.smali $OUT_FRAMEWORK_DIR/smali/com/android/server/power/
    applyPatch "overlay/services"
fi
