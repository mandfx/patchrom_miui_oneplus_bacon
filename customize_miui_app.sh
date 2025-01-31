#!/bin/bash
#

XMLMERGYTOOL=$PORT_ROOT/tools/ResValuesModify/jar/ResValuesModify
GIT_APPLY=$PORT_ROOT/tools/git.apply
curdir=`pwd`

function applyPatch () {
    for patch in `find $1 -name *.patch`
    do
        cd out
        $GIT_APPLY ../$patch
        cd ..
        for rej in `find $2 -name *.rej`
        do
            echo "Patch $patch fail"
            exit 1
        done
    done
}

function changeID () {
    tools_dir=$curdir/other/tools
    if [ -f out/framework-res_miui/res/values/public.xml ]; then
        echo "exists!"
    else
        apktool d -f $PORT_ROOT/miui/XXHDPI/system/framework/framework-res.apk -o out/framework-res_miui
    fi
    cd out
    python $tools_dir/idtoname.py framework-res_miui/res/values/public.xml $1/smali
    python $tools_dir/nametoid.py $curdir/framework-res/res/values/public.xml $1/smali
    cd -
}

if [ $1 = "miuisystem" ];then
    sed -i '/  - 16/a\  - 17' $2/apktool.yml
    applyPatch $1 $2
    cp $1/A0001.xml $2/assets/device_features/
fi

if [ $1 = "TeleService" ];then
    applyPatch $1 $2
    $XMLMERGYTOOL $1/res/values $2/res/values
    #fix read sim card contact preson
    sed -i 's/MiuiIccProvider/IccProvider/g' $2/smali/com/android/phone/IccProvider.smali
fi

if [ $1 = "Settings" ];then
    sed -i '/  - 17/a\  - 18' $2/apktool.yml
    applyPatch $1 $2
    $XMLMERGYTOOL $1/res/values $2/res/values
    $XMLMERGYTOOL $1/res/values-zh-rCN $2/res/values-zh-rCN
    #fix button light timeout
    sed -i 's/screen_buttons_timeout/button_backlight_timeout/g' $2/smali/com/android/settings/KeySettings.smali
    #remove mi sound
    sed -i 's/<bool name="support_dirac">true<\/bool>/<bool name="support_dirac">false<\/bool>/' $2/res/values/bools.xml
fi

if [ $1 = "SecurityCenter" ];then
    applyPatch $1 $2
    sed -i '/  - 16/a\  - 18' $2/apktool.yml
    sed -i '/- 18/a\sdkInfo:\n minSdkVersion: '\''19'\''\n targetSdkVersion: '\''23'\''' $2/apktool.yml
fi

if [ $1 = "MiuiSystemUI" ];then
    applyPatch $1 $2
    $XMLMERGYTOOL $1/res/values $2/res/values
    #fix torch light
    sed -i 's/\/sys\/class\/leds\/flashlight\/brightness/\/sys\/class\/leds\/torch-light\/brightness/g' $2/smali/com/android/systemui/TorchServiceView.smali
    changeID $1
fi

if [ $1 = "DeskClock" ];then
    changeID $1
fi

if [ $1 = "Updater" ];then
    applyPatch $1 $2
fi

if [ $1 = "DownloadProvider" ];then
    changeID $1
fi

if [ $1 = "XiaomiServiceFramework" ];then
    applyPatch $1 $2
fi

if [ $1 = "ThemeManager" ];then
    applyPatch $1 $2
fi
