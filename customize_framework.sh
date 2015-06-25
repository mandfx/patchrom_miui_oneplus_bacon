#!/bin/bash
# $1: dir for miui
# $2: dir for original

APKTOOL="$PORT_ROOT/tools/apktool --quiet"
GIT_APPLY=$PORT_ROOT/tools/git.apply
BUILD_OUT=out

SEP_FRAME="framework2.jar.out"

function applyPatch() {
	for file in $1/*.patch
	do
		cp $file out/
		cd out
		git.apply `basename $file`
        for file2 in `find $2 -name *.rej`
        do
            echo "$file2 fail"
            exit 1
        done
		cd ..
	done
}


if [ $2 = "$BUILD_OUT/framework" ]
then
    cp -rf ../android/Editor/* $BUILD_OUT/framework/smali/android/widget/
    rm -rf $BUILD_OUT/framework/smali/android/telephony/*
    cp -rf overlay/framework/* $BUILD_OUT/framework/
fi

if [ $2 = "$BUILD_OUT/framework2" ]
then
    rm -rf $BUILD_OUT/framework2/smali/com/android/internal/telephony/*
    cp -rf overlay/framework2/* $BUILD_OUT/framework2/
fi

if [ $2 = "$BUILD_OUT/telephony-common" ]
then
    rm -rf $BUILD_OUT/telephony-common/smali
    cp -rf overlay/telephony-common/* $BUILD_OUT/telephony-common/
fi

if [ $2 = "$BUILD_OUT/services" ]
then
    applyPatch "overlay/services"
    cp -rf overlay/services/* $BUILD_OUT/services/
fi

if [ $2 = "$BUILD_OUT/android.policy" ]
then
    applyPatch "overlay/android.policy"
fi
