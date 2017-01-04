#!/bin/bash

APKTOOL=$PORT_ROOT/tools/apktool
MIUI_JARS=$PORT_ROOT/miui/system/framework
OUT=out
ZIP_DIR=$OUT/ZIP

$APKTOOL d -f $MIUI_JARS/patchrom-core.jar -o $OUT/patchrom-core

rm -rf $OUT/patchrom-core/smali/android/accounts
rm -rf $OUT/patchrom-core/smali/android/app
rm -rf $OUT/patchrom-core/smali/android/content
rm -rf $OUT/patchrom-core/smali/android/util
rm -rf $OUT/patchrom-core/smali/android/view
rm -rf $OUT/patchrom-core/smali/android/webkit
rm -rf $OUT/patchrom-core/smali/android/widget
rm -rf $OUT/patchrom-core/smali/com/android/internal/os

$APKTOOL b $OUT/patchrom-core -o $OUT/patchrom-core.jar
cp -rf $OUT/patchrom-core.jar $ZIP_DIR/system/framework/patchrom-core.jar
