#!/bin/bash

APKTOOL=$PORT_ROOT/tools/apktool
MIUI_JARS=$PORT_ROOT/miui/system/framework
OUT=out
ZIP_DIR=$OUT/ZIP

$APKTOOL d -f $MIUI_JARS/patchrom-core.jar -o $OUT/patchrom-core

rm -rf $OUT/patchrom-core/smali/android/app/ActivityThreadHook.smali

$APKTOOL b $OUT/patchrom-core -o $OUT/patchrom-core.jar
cp -rf $OUT/patchrom-core.jar $ZIP_DIR/system/framework/patchrom-core.jar
